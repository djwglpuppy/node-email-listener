net = require("net")
Event = require("events").EventEmitter
_ = require("underscore")

class ServerListener extends Event

    start: (port = 25) ->
        self = @
        server = net.createServer (stream) ->
            stream.setEncoding "utf8"
            stream.out = (msg) -> stream.write(msg + '\r\n')
            stdresponse = -> stream.out('250 nodejs.io')

            stream.isBody = false
            stream.body = ""
            stream.recipient = ""
            stream.on "connect", ->
                stream.isBody = false
                stream.body = ""
                stream.recipient = ""
                stream.out('220 SMTP nodejs')

            stream.on "data", (m) ->
                code = m.split(" ")[0].match(/.*/)[0]

                if stream.isBody
                    lines = _.compact(m.split('\r\n'))
                    stream.isBody = false if _.last(lines) is "."
                    stream.body += m
                    self.emit("msg", stream.recipient, stream.body) if not stream.isBody

                switch code
                    when "EHLO"
                        stream.out('502 Unsupported here')
                    when "RCPT"
                        stream.recipient = m.match(/\<(.*)\>/)[1]
                        stdresponse()
                    when "DATA"
                        stream.isBody = true
                        stream.out('354 Enter mail, end with "." on a line by itself')
                    when "QUIT"
                        stream.out('221 Bye')
                        stream.destroy()
                    else
                        stdresponse()


        server.listen(port)
        console.log "mail listener has started on port #{port}"

    trim:(text) -> text.replace(/^\s+|\s+$/gi, '')


    parseBody: (body) ->
        self = @
        headerMatrix = [
            "Received",
            "DKIM-Signature"
            "MIME-Version"
            "Received"
            "Reply-To"
            "In-Reply-To"
            "References"
            "Date"
            "Message-ID"
            "Subject"
            "From"
            "To"
            "Cc"
            "References"
            "Content-Type"
            "Content-Transfer-Encoding"
        ]

        emailData = 
            received: []
            dkim: ""
            mimeVersion: ""
            replyTo: ""
            date: ""
            messageID: ""
            inreplyTo: ""
            references: ""
            subject: ""
            from: ""
            to: ""
            body:
                plain: ""
                html: ""
            attachment: "COMING SOON"


        headerData = {}
        currentHeader = ""
        isContent = false
        boundary = ""
        boundaryTriggered = false
        bodyType = ""
        _.each body.split("\n"), (line) ->
            headerLine = line.match(/(^\s?.*)\:\s(.*)/i)

            dataAppend = ->
                content = '\n' + self.trim(line)

                if isContent
                    if boundary isnt "" and self.trim(line) is "--#{boundary}"
                        boundaryTriggered = true
                    else if self.trim(line) isnt "--#{boundary}--" and bodyType isnt ""
                        emailData.body[bodyType] += content
                    else
                        bodyType = ""
                else
                    switch currentHeader
                        when "Received"
                            emailData.received[emailData.received.length - 1] += content
                        when "DKIM-Signature"
                            emailData.dkim += content
                        when "To"
                            emailData.to += content
                        when "Cc"
                            emailData.cc += content

            if headerLine?
                if _.indexOf(headerMatrix, headerLine[1]) isnt -1
                    currentHeader = headerLine[1]

                    content = self.trim(headerLine[2])
                    switch currentHeader
                        when "Received"
                            emailData.received.push(content)
                        when "DKIM-Signature"
                            emailData.dkim = content
                        when "MIME-Version"
                            emailData.mimeVersion = content
                        when "Reply-To"
                            emailData.replyTo = content
                        when "Date"
                            emailData.date = new Date(content)
                        when "Message-ID"
                            emailData.messageID = content
                        when "In-Reply-To"
                            emailData.inreplyTo = content
                        when "References"
                            emailData.references = content
                        when "Subject"
                            emailData.subject = content
                        when "From"
                            emailData.from = content
                        when "To"
                            emailData.to = content
                        when "Cc"
                            emailData.cc = content
                        when "Content-Type"
                            infotype = content.split(";")

                            buildFor = ->
                                switch infotype[0]
                                    when "text/html"
                                        bodyType = "html"
                                    when "text/plain"
                                        bodyType = "plain"
                                    else
                                        bodyType = ""

                            if isContent
                                if boundaryTriggered
                                    boundaryTriggered = false
                                    buildFor()

                            else
                                switch infotype[0]
                                    when "multipart/alternative"
                                        boundary = infotype[1].match(/.*boundary\=(.*)/i)[1]
                                        isContent = true
                                    when "multipart/related", "multipart/mixed"
                                        #TODO: Attachments for mixed ... how to handle related (inline images)?
                                        true
                                    else
                                        buildFor()
                                        isContent = true

                else
                    dataAppend()
            else
                dataAppend()

        return emailData


module.exports = new ServerListener()
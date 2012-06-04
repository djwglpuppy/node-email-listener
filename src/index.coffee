net = require("net")
Event = require("events").EventEmitter
MailParser = require("mailparser").MailParser
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

                    if not stream.isBody
                        mailparser = new MailParser
                        mailparser.on "end", (mail_object) ->
                            self.emit("msg", stream.recipient, stream.body, mail_object)

                        mailparser.write(stream.body)
                        mailparser.end()

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

module.exports = new ServerListener()
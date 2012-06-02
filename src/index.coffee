net = require("net")
Event = require("events").EventEmitter
_ = require("underscore")

exports.listener = newmsg = new Event()

exports.start = (port = 25) ->
    server = net.createServer (stream) ->
        stream.setEncoding "utf8"
        stream.out = (msg) -> stream.write(msg + '\r\n')
        stdresponse = -> stream.out('250 nodejs.io')

        stream.isBody = false
        stream.body = ""
        stream.sender = ""
        stream.on "connect", ->
            stream.isBody = false
            stream.body = ""
            stream.sender = ""
            stream.out('220 SMTP nodejs')

        stream.on "data", (m) ->
            code = m.split(" ")[0].match(/.*/)[0]

            if stream.isBody
                lines = _.compact(m.split('\r\n'))
                stream.isBody = false if _.last(lines) is "."
                stream.body += m
                newmsg.emit("msg", stream.sender, stream.body) if not stream.isBody

            switch code
                when "EHLO"
                    stream.out('502 Unsupported here')
                when "RCPT"
                    stream.from = m
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
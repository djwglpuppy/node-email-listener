#node.js email listener
This will allow you to create a simple email receiving server that will listen for new messages and then trigger an event. You can then parse through the message of the body any way you want.

[http://email-listener.nodejs.io/] (http://email-listener.nodejs.io/)

Use the link above to test the app.

##installation

```
npm install email-listener
```

##usage


```javascript
var emaillisten = require("email-listener");

//The optional argument will be the port to listen on
//(defaults to 25)
emaillisten.start();

//Listener Event
emaillisten.on("msg", function(recipient, rawbody, parsed){

    //Whom the message is for
    console.log(recipient);
    
    //The raw contents of the message body
    console.log(rawbody);
    
    //This is the parsed message as an object with useful and easy ways to work with the message
    console.log(parsed);
    
    
});
```

##parsed message

[https://github.com/andris9/mailparser] (https://github.com/andris9/mailparser)

This library is used to parse the message, please refer to it about what is returned in the `parsed` return in the callback.  There will be more options to control this in future releases.  For now, it just returns the parsed message with the default options.





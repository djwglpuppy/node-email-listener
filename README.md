#node.js email listener
This will allow you to create a simple email receiving server that will listen for new messages and then trigger an event. You can then parse through the message of the body any way you want.

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
emaillisten.on("msg", function(recipient, body){

    //Whom the message is for
    console.log(recipient);
    
    //The raw contents of the message body
    console.log(body);
    
});
```

##notes
Right now it just emits the raw body of the email message.  I eventually want to send the body parsed on sepearated appropriately

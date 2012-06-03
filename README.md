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
    
    //Here you can use the parseBody function to organize data better
    //This is still a work in progress.. so use at your own risk
    console.log(this.parseBody(body))
    
    
});
```

##guide

###parseBody(body) method

This will take the raw body of the email and try to turn it into easier data to work with.  This has been tested against a handful of emails, but needs to continue to get it working the best it can.  currently, there is no support for attachments, but that will be coming shortly.

##notes
Right now it just emits the raw body of the email message.  I eventually want to appropriately parse and return the body for easier manipulation.

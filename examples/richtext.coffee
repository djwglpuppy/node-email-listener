server = require("../src")
_ = require("underscore")




server.start()


server.on "msg", (recipient, body) ->
    console.log @parseBody(body)



server.emit("msg", "RCPT TO:<test@nodejs.io>", """

Received: by werb13 with SMTP id b13so3027165wer.17
        for <test@nodejs.io>; Sat, 02 Jun 2012 20:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:reply-to:date:message-id:subject:from:to:content-type;
        bh=RCz933grlC/TF/lEZiNI0Npwm39bk6M8M+Lj4GQ36JU=;
        b=pdOxatFjWf04Bx8UuTTDF5hFAyseUt33rnjM7wjeUEitvPKqP0CwKrtlvfsF1S9l7j
         OTWaqmymQr0XiZM/CDba24BEaevgwCIVlKF+tyvaZB0MvDqhXRg/CO1m0H1Zd2wOq3Nx
         /Qs58dkFZJFTI+4UI9lTtY2pyhc+MbFN9c/FF8jnNZ9PyHO5+IntGD3UmP6/aArJ+lAS
         ZgCi5OUjn56DSSfby/+YpT4IklVMCpLHE681CYBuRyFEwrzqdXWaCIeRm5pikBeST/TA
         BKBIUaw2pG2U1hpg2asNoPNu4Y/5SA5JmHEut4Wx+nPf9I6yGY9JMHCWQ80H+ISY0Lun
         YREg==
MIME-Version: 1.0
Received: by 10.216.145.157 with SMTP id p29mr6779990wej.65.1338693628411;
 Sat, 02 Jun 2012 20:20:28 -0700 (PDT)
Received: by 10.223.79.7 with HTTP; Sat, 2 Jun 2012 20:20:28 -0700 (PDT)
Reply-To: chazroberts@gmail.com
Date: Sat, 2 Jun 2012 20:20:28 -0700
Message-ID: <CAAf=x5XAZM6WHs=OCbk9trbZhF72X+GrT7sk3-J+TSnK7eVucw@mail.gmail.com>
Subject: asdfasdf
From: David Roberts <chazroberts@gmail.com>
To: test@nodejs.io
Content-Type: multipart/alternative; boundary=0016e6dab0742f40d504c188e601

--0016e6dab0742f40d504c188e601
Content-Type: text/plain; charset=ISO-8859-1

asdf asd fasdfasdf
as
-- 
David K Roberts
chazroberts@gmail.com
cell:312-772-2167

--0016e6dab0742f40d504c188e601
Content-Type: text/html; charset=ISO-8859-1

asdf asd fasdfasdf<br clear="all"><div>as</div>-- <br>David K Roberts<br><a href="mailto:chazroberts@gmail.com" target="_blank">davidroberts@gmail.com</a><br>cell:312-772-2167<br>skype: djwglpuppy<br><br>

--0016e6dab0742f40d504c188e601--
.
                                                                                                                                                                                                                       
""")

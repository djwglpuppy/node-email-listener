server = require("../src")
_ = require("underscore")




server.start()


server.on "msg", (recipient, body) ->
    console.log @parseBody(body)



server.emit("msg", "RCPT TO:<test@nodejs.io>", """

                                                                                                                                                                                                                                                               
Delivered-To: davidroberts@gmail.com
Received: by 10.223.79.7 with SMTP id n7csp315830fak;
        Thu, 31 May 2012 08:07:30 -0700 (PDT)
Return-Path: <burtonrast@gmail.com>
Received-SPF: pass (google.com: domain of burtonrast@gmail.com designates 10.60.14.193 as permitted sender) client-ip=10.60.14.193;
Authentication-Results: mr.google.com; spf=pass (google.com: domain of burtonrast@gmail.com designates 10.60.14.193 as permitted sender) smtp.mail=burtonrast@gmail.com; dkim=pass header.i=burtonrast@gmail.com
Received: from mr.google.com ([10.60.14.193])
        by 10.60.14.193 with SMTP id r1mr3023933oec.16.1338476850560 (num_hops = 1);
        Thu, 31 May 2012 08:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=o02hwX68h0QGhqqMtpQJJ1FKXPCgbnBhrjOwcnPlyBM=;
        b=ZpjJAfRPumT57WMM2wI0JWDFaEvEcIW1d280ZZamS6WssJTeOeXUjBmQ/bR0QK4RGB
         Sg2xckmaUePpQKgnU7Xkxdpez1TrG4dtFygChYDp6mgUvjQW/zuBlKW28wbOXvAuklPt
         GYCUDvjr1jE8JM07+IOYwdTM4Iu/wLOTJFEpV+VSZRflH7k47z0Y+iSfl1OqCyMFT7hQ
         Z6FQlkQ6PecSLyX5wiwbALsHh0FBJghPYS7NjAQB0MHYbm/USlww8h+bprUIar1z+uAK
         N3qRgeP7OfjcI7xyWdofTfRT9TvMYh5FDPQ1D96oJYFj/VkpJ7UVX6lMNkZ73fUK9+et
         I8Bg==
Received: by 10.60.14.193 with SMTP id r1mr2479114oec.16.1338476850546; Thu,
 31 May 2012 08:07:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.142.103 with HTTP; Thu, 31 May 2012 08:07:10 -0700 (PDT)
In-Reply-To: <CAAf=x5WVk8FhD8nEyJSSoEGakNvBeunEJ8ookWVxpHwTO5oEGQ@mail.gmail.com>
References: <B500FF9E-C954-4C42-AC77-3ABB0009DADE@gmail.com>
 <4E6E29EE-7A07-4D5F-9CB5-1DC430C0659D@gmail.com> <CACCSUjvqxXWkFNvRTBMJ+LU6PfkR7uRc4D-ErLHs_sG8NwKxEw@mail.gmail.com>
 <CAAf=x5WVk8FhD8nEyJSSoEGakNvBeunEJ8ookWVxpHwTO5oEGQ@mail.gmail.com>
From: burton rast <burtonrast@gmail.com>
Date: Thu, 31 May 2012 10:07:10 -0500
Message-ID: <CAPGS8pThY64KvPTaj7Sp=47gyn9XrvHbVvbrBeFBBOr1aY-J7Q@mail.gmail.com>
Subject: Re: Amercia Is With Mitt!
To: davidroberts@gmail.com
Cc: Scott Friedman <scott.friedman@gmail.com>, Ken Richardson <ken.richardson@gmail.com>, 
    Dave Rast <daveruin@gmail.com>, Fernando Rossi <hello@nandorocker.com>
Content-Type: multipart/alternative; boundary=e89a8ff252ee3787d604c1566da7

--e89a8ff252ee3787d604c1566da7
Content-Type: text/plain; charset=ISO-8859-1

i am never updating this app.

On Thu, May 31, 2012 at 10:01 AM, David Roberts <davidroberts@gmail.com>wrote:

> I love it!
>
> On Thu, May 31, 2012 at 7:32 AM, Scott Friedman
> <scott.friedman@gmail.com> wrote:
> > http://yfrog.com/nw24jfcj
> >
> > Colbert always sums things up simply.
> >
> >
> > On Wed, May 30, 2012 at 1:34 AM, Burton Rast <burtonrast@gmail.com>
> wrote:
> >>
> >> wow, that happens fast.
> >>
> >>
> >>
> >> On May 30, 2012, at 12:59 AM, David K Roberts <davidroberts@gmail.com>
> >> wrote:
> >>
> >> > http://amerciaiswithmitt.tumblr.com/
> >> >
> >> >
> >> > Sent from my iPad
> >
> >
>
>
>
> --
> David K Roberts
> davidroberts@gmail.com
> cell:312-772-2167
> skype: djwglpuppy
>

--e89a8ff252ee3787d604c1566da7
Content-Type: text/html; charset=ISO-8859-1

i am never updating this app.<br><br><div class="gmail_quote">On Thu, May 31, 2012 at 10:01 AM, David Roberts <span dir="ltr">&lt;<a href="mailto:davidroberts@gmail.com" target="_blank">davidroberts@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I love it!<br>
<div class="HOEnZb"><div class="h5"><br>
On Thu, May 31, 2012 at 7:32 AM, Scott Friedman<br>
&lt;<a href="mailto:scott.friedman@gmail.com">scott.friedman@gmail.com</a>&gt; wrote:<br>
&gt; <a href="http://yfrog.com/nw24jfcj" target="_blank">http://yfrog.com/nw24jfcj</a><br>
&gt;<br>
&gt; Colbert always sums things up simply.<br>
&gt;<br>
&gt;<br>
&gt; On Wed, May 30, 2012 at 1:34 AM, Burton Rast &lt;<a href="mailto:burtonrast@gmail.com">burtonrast@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; wow, that happens fast.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On May 30, 2012, at 12:59 AM, David K Roberts &lt;<a href="mailto:davidroberts@gmail.com">davidroberts@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; <a href="http://amerciaiswithmitt.tumblr.com/" target="_blank">http://amerciaiswithmitt.tumblr.com/</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Sent from my iPad<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
</div></div><span class="HOEnZb"><font color="#888888">--<br>
David K Roberts<br>
<a href="mailto:davidroberts@gmail.com">davidroberts@gmail.com</a><br>
cell:<a href="tel:312-772-2167" value="+13127722167">312-772-2167</a><br>
skype: djwglpuppy<br>
</font></span></blockquote></div><br>

--e89a8ff252ee3787d604c1566da7--
                                                                                                                                                                                                                                                            
""")
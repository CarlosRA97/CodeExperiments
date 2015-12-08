#!/usr/bin/env ruby

require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <test@todomain.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

YourDomain = 'localhost'
YourAccountName = 'carl.riv.aro@outlook.com'
YourPassword = 'crakpkp06061997@'
FromAddress = 'carl.riv.aro@outlook.com'
ToAddress = 'carlosriveroaro7@gmail.com'

smtp = Net::SMTP.new 'smtp-mail.outlook.com', 587
smtp.enable_starttls
smtp.start(YourDomain, YourAccountName, YourPassword, :login) do
    smtp.send_message(message, FromAddress, ToAddress)
end
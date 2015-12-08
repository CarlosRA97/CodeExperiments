#!/usr/bin/env ruby

require "fileutils"
require 'net/smtp'

def windows?
	(/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RbConfig::CONFIG["host_os"]) != nil
end
def mac?
	(/darwin/ =~ RbConfig::CONFIG["host_os"]) != nil
end
def linux?
	not windows? and not mac?
end

src = "G:" if windows?
dest = "C:\Users\Sabino\Descargas" if windows?

src = "/Volumes" if mac?
dest = "/Users/Carlos/" if mac?

src = "/media" if linux?
dest = "/home/carlos/" if linux?

pen = "ESD-USB"

localizePen = Dir.glob File.join(src,"*")
#subDirPen = Dir.glob File.join(src,pen,"**/")
puts localizePen

logFileDir = File.join(dest,"Horario de clases 2Bach.pdf")

def Directories(p)
	Dir.entries(p).select do |entry| File.directory? File.join(p,entry) and !(entry =="." || entry == "..") end
end

# f es una array de los archivos contenidos en el destino

def check_copy(src,dir1,dest)
	
	f = Dir.entries(dest).select {|entry| File.directory? File.join(dest,entry) and !(entry =="." || entry == "..") }	
	
	for folder in f
		if folder == dir1
			break
		else
			next
		end
	end
	FileUtils.copy_entry src,dest
end

def log_file (s,o,n)
	File.open(n,o) do |f|
		f.puts s
	end
end
def search(src,pen)#dest
	subDirPen = Dir.glob File.join(src,pen,"**/")
	log_file subDirPen, "w+","logUSB.txt"
	#for dir in Directories(src)
	#	if dir == "ESD-USB"
	#		src << "/" << dir
	#		for dir1 in Directories(src)
	#			if dir1 == "Copy"
	#				check_copy src,dir1,dest
	#			else
	#				log_file "("+dir1+")" + "[dir1]" + " | ", "a+"
	#			end
	#		end
	#	else
	#		log_file "("+dir+")" + "[dir]" + " | ", "w+"
	#	end
	#end
end

def emailSender(text)
filename = text
# Read a file and encode it into base64 format
filecontent = File.read(filename)
encodedcontent = [filecontent].pack("m")   # base64

marker = "AUNIQUEMARKER"

body =<<EOF
This is a test email to send an attachement.
EOF

# Define the main headers.
part1 =<<EOF
From: Private Person <me@fromdomain.net>
To: A Test User <test@todmain.com>
Subject: Sending Attachement
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=#{marker}
--#{marker}
EOF

# Define the message action
part2 =<<EOF
Content-Type: text/plain
Content-Transfer-Encoding:8bit

#{body}
--#{marker}
EOF

# Define the attachment section
part3 =<<EOF
Content-Type: multipart/mixed; name=\"#{filename}\"
Content-Transfer-Encoding:base64
Content-Disposition: attachment; filename="#{filename}"

#{encodedcontent}
--#{marker}--
EOF

	mailtext = part1 + part2 + part3

# Let's put our code in safe area  

yourDomain = 'localhost'
yourAccountName = 'carl.riv.aro@outlook.com'
yourPassword = 'crakpkp06061997@'
fromAddress = 'carl.riv.aro@outlook.com'
toAddress = 'carlosriveroaro7@gmail.com'

smtp = Net::SMTP.new 'smtp-mail.outlook.com', 587
smtp.enable_starttls
smtp.start(yourDomain, yourAccountName, yourPassword, :login) do
    smtp.send_message(mailtext, fromAddress, toAddress)
end
end

#search src,pen
#log_file localizePen,"w+","Devices.txt"
emailSender logFileDir

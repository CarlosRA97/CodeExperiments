#!/usr/bin/env ruby

require 'fileutils'

def windows?
	(/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RbConfig::CONFIG["host_os"]) != nil
end
def mac?
	(/darwin/ =~ RbConfig::CONFIG["host_os"]) != nil
end
def linux?
	not windows? and not mac?
end

src = 'G:' if windows?
dest = 'C:\Users\Sabino\Descargas' if windows?

src = '/Volumes' if mac?
dest = '/Users/Carlos/' if mac?

src = '/media/sabino' if linux?
dest = '/home/sabino/' if linux?

 src
 dest

def Directories(p)
	Dir.entries(p).select do |entry| File.directory? File.join(p,entry) and !(entry =='.' || entry == '..') end
end

# f es una array de los archivos contenidos en el destino

def check_copy(src,dir1,dest)
	
	f = Dir.entries(dest).select {|entry| File.directory? File.join(dest,entry) and !(entry =='.' || entry == '..') }	
	
	for folder in f
		if folder == dir1
			break
		else
			next
		end
	end
	FileUtils.copy_entry src,dest
end

def log_file (s,o)
	File.open("logUsb.txt", o) do |f|
		f.write(s)
	end
end
def search(src,dest)
	for dir in Directories(src)
		if dir == 'ESD-USB'
			src << '/' << dir
			for dir1 in Directories(src)
				if dir1 == 'Copy'
					src << '/' << dir1
					check_copy src,dir1,dest
				else
					log_file "("+dir1+")" + "[dir1]" + " | ", "a+"
				end
			end
		else
			if File.file? 'logUsb.txt'
				log_file "("+dir+")" + "[dir]" + " | ", "r+"
			else
				log_file "("+dir+")" + "[dir]" + " | ", "w+"
			end
		end
	end
end

while true
	search src,dest
end

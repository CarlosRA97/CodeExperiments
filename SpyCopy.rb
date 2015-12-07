#!/usr/bin/env ruby

require 'fileutils'

class OS?
	def initialize
	end
	def windows?
		(/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RbConfig::CONFIG["host_os"]) != nil
	end
	def mac?
		(/darwin/ =~ RbConfig::CONFIG["host_os"]) != nil
	end
	def linux?
		not windows? and not mac?
	end
end

src = 'G:' if OS?.windows?
dest = 'C:\Users\Sabino\Descargas' if OS?.windows?

src = '/Volumes' if OS?.mac?
dest = '/Users/Carlos/' if OS?.mac?

src = '/media' if OS?.linux?
dest = '/home/carlos/' if OS?.linux?

src2 = File.join(src,"*")
subDir = Dir.glob(File.join(src2,"**")) 

def Directories(p)
	Dir.entries(p).select do |entry| File.directory? File.join(p,entry) and !(entry =='.' || entry == '..') end
end

def check_copy(src,dir1,dest)
	
	# f es una array de los archivos contenidos en el destino
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
		f << s
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

search src,dest

log_file subDir, 'a+'

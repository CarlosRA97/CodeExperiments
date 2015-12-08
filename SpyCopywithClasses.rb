#!/usr/bin/env ruby

require 'fileutils'

class Host_os
	def initialize
	end
	def windows?
		w = (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RbConfig::CONFIG["host_os"]) != nil
	end
	def mac?
		m = (/darwin/ =~ RbConfig::CONFIG["host_os"]) != nil
	end
	def linux?
		l = !windows? and !mac?
	end
end

class Action	
	def initialize(src)
		@Directories = Directories.new
	end
	
	def searchfCopy(src,dest)
		for dir in arraySrc
			if dir == ''
				src << '/' << dir
				for dir1 in @Directories.arrayDir(@Directories.defaultDir)
					if dir1 == ''
						src << '/' << dir1
						check_copy src,dir1,dest
					end
				end
			end
		end
	end
	
	def checkCopy(src,dir1,dest)
		# f es una array de los archivos contenidos en el destino
		f = Dir.entries(dest).select {|entry| File.directory? File.join(dest,entry) and !(entry =='.' || entry == '..') }	
	
		for folder in f
			if File.exist? dir1 and folder == dir1
				break
			else
				next
			end
		end
		FileUtils.copy_entry src,dest
	end
	
	def logFile (s,option)
		File.open("logUsb.txt", option) do |f|
			f << s
		end
	end
	
	def logOutput
	end
end

class Directories
	def initialize(w,m,l)
		@host_os = Host_os.new(w,m,l)
		@host_os.windows?
		@host_os.mac?
		@host_os.linux?
	end
	
	def arrayDir(p)
		return Dir.entries(p).select do |entry| File.directory? File.join(p,entry) and !(entry =='.' || entry == '..') end
	end
	def defaultDir(w,m,l)
		src = 'G:' if w
		dest = 'C:\Users\Sabino\Descargas' if w

		src = '/Volumes' if m
		dest = '/Users/Carlos/' if m

		src = '/media' if l
		dest = '/home/carlos/' if l
	end
	def subDir(src)
		Dir.glob(File.join(src,"**","**","**")) 
	end
end

host = Host_os.new
dir = Directories.new(host)
action = Action.new(dir)

puts action.searchfCopy(dir.defaultDir,dir.defaultDir)
puts action.methods


#action.search src,dest

#log_file subDir, 'a+'

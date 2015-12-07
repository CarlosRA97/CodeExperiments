#!/usr/bin/env ruby

require 'fileutils'

class Host_os
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

class Action	
	def initialize(src)
		@Directories = Directories.new
	end
	
	def searchfCopy(src,dest)
		for dir in arraySrc
			if dir == ''
				@Directories.defaultDir(src) << '/' << dir
				for dir1 in @Directories.arrayDir(@Directories.defaultDir)
					if dir1 == ''
						@Directories.defaultDir(src) << '/' << dir1
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
	def initialize()
		@host_os = Host_os.new
	end
	
	def arrayDir(p)
		return Dir.entries(p).select do |entry| File.directory? File.join(p,entry) and !(entry =='.' || entry == '..') end
	end
	def defaultDir
		src = 'G:' if @host_os.windows?
		dest = 'C:\Users\Sabino\Descargas' if @host_os.windows?

		src = '/Volumes' if @host_os.mac?
		dest = '/Users/Carlos/' if @host_os.mac?

		src = '/media' if @host_os.linux?
		dest = '/home/carlos/' if @host_os.linux?
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

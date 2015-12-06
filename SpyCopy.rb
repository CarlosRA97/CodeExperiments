#!/usr/bin/env ruby

require 'fileutils'

module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.linux?
    not OS.windows? and not OS.mac?
  end
end

def osC
	if OS.windows?
		src = 'D:'
		dest = 'C:\Users\Sabino'
	if OS.mac?
		src = '/Volumes'
		dest = '/Users/Carlos/'
	else
		src = '/media'
		dest = '/home/carlos/Escritorio'
	end
end

def Directories(p)
	Dir.entries(p).select do |entry| File.directory? File.join(p,entry) and !(entry =='.' || entry == '..') end
end

# f es una array de los archivos contenidos en el destino

f = Dir.entries(dest).select {|entry| File.directory? File.join(dest,entry) and !(entry =='.' || entry == '..') }

def check_copy(src,f,dir1,dest)
	for folder in f
		if folder == dir1
			puts 'Se ha encontrado el archivo'
			break
		else
			FileUtils.copy_entry src,dest
		end
	end
end

def log_file (s)
	File.open("logUsb.txt", "a+") do |f|     
		f.write(s)   
	end
end

for dir in Directories(src)

	if dir == 'ESD-USB' and 
		src << '/' << dir

		for dir1 in Directories(src)

			if dir1 == 'Copy'
				src << '/' << dir1

				check_copy src,f,dir1,dest
			else
				log_file "("+dir1+")" + "[dir1]" + " | "
			end
		end
	else
		log_file "("+dir+")" + "[dir]" + " | "
	end
end

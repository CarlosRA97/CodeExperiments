#!/usr/bin/env ruby

require 'fileutils'

src = '/media'
dest = '/home/carlos/Escritorio'

def Directories(p)
	Dir.entries(p).select {|entry| File.directory? File.join(p,entry) and !(entry =='.' || entry == '..') }
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
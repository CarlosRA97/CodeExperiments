#!/usr/bin/env ruby

require 'fileutils'

#FileUtils.copy_entry , '/home/carlos/Copy'

src = '/media'
dest = '/home/carlos/Escritorio'

puts src

def Directories(p)
	Dir.entries(p).select {|entry| File.directory? File.join(p,entry) and !(entry =='.' || entry == '..') }
end

f = Dir.entries(dest).select {|entry| File.directory? File.join(dest,entry) and !(entry =='.' || entry == '..') }

print f

def check_copy(src,f,dir1)
	for folder in f
		if File.directory?(dir1)
			break
		else
			FileUtils.copy_entry src,f
		end
	end
end

for dir in Directories(src)

	if dir == 'ESD-USB'
		print src << '/' << dir
		puts ''

		for dir1 in Directories(src)

			if dir1 == 'Copy'
				print src << '/' << dir1
				puts ''

				check_copy(src,f,dir1)
				#File.open("out.txt", "w") do |f|     
				#	f.write(src)   
				#end
			end
		end
	else
		
		
		
	end
end

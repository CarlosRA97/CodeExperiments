#!/usr/bin/env ruby

#require 'fileutils'

#FileUtils.copy_entry , '/home/carlos/Copy'

src = '/media'
f = '/home/carlos/Escritorio'

puts src
puts '1'

Directories = Dir.entries(src).select {|entry| File.directory? File.join(src,entry) and !(entry =='.' || entry == '..') }

for dir in Directories

	if dir == 'ESD-USB'
		print src << '/' << dir
		puts ''

		Directories = Dir.entries(src).select {|entry| File.directory? File.join(src,entry) and !(entry =='.' || entry == '..') }
		print Directories

		puts ''
		for dir1 in Directories

			if dir1 == 'Copy'
				print src << '/' << dir1
				puts ''

				Directories = Dir.entries(src).select {|entry| File.directory? File.join(src,entry) and !(entry =='.' || entry == '..') }
				print Directories

				puts ''
				#File.open("out.txt", "w") do |f|     
				#	f.write(src)   
				#end
			end
		end
	end
end

	

#FileUtils.copy_entry src,f

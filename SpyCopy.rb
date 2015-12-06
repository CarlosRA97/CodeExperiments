#!/usr/bin/env ruby

require 'fileutils'

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

		$dir1 = Dir.entries(src).select {|entry| File.directory? File.join(src,entry) and !(entry =='.' || entry == '..') }

		print dir1
		puts ''
	end
end

for dir2 in $dir1
	if $dir1 == 'Copy'
		print src << '/' << dir2
		puts '3'
		dir3 = Dir.entries(src).select {|entry| File.directory? File.join(src,entry) and !(entry =='.' || entry == '..') }
		File.open("out.txt", "w") do |f|     
			f.write(src)   
		end
	end
end
	

#FileUtils.copy_entry src,f

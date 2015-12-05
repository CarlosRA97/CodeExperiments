#!/usr/bin/env ruby

#require 'fileutils'

#FileUtils.copy_entry , '/home/carlos/Copy'

src = '/media'

Directories = Dir.entries(src).select {|entry| File.directory? File.join(src,entry) and !(entry =='.' || entry == '..') }

for dir in Directories
	if dir == '/ESD-USB'
		src << dir
		dir1 = Dir.entries(src).select {|entry| File.directory? File.join(src,entry) and !(entry =='.' || entry == '..') }
		for dir2 in dir1
			if dir2 == '/Copy'
				src << dir2
				dir3 = Dir.entries(src).select {|entry| File.directory? File.join(src,entry) and !(entry =='.' || entry == '..') }
			end
		end
	else
		File.new 
		File.open("Susb.txt", 'a') {|f| f.write(dir) } 
end
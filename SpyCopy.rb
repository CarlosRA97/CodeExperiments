#!/usr/bin/env ruby

#require 'fileutils'

#FileUtils.copy_entry , '/home/carlos/Copy'

src = '/media/'

Directories = Dir.entries(src).select {|entry| File.directory? File.join(src,entry) and !(entry =='.' || entry == '..') }

for dir in Directories
	if dir == "ESD-USB"
		nDir = src + dir
		dir1 = Dir.entries(nDir).select {|entry| File.directory? File.join(nDir,entry) and !(entry =='.' || entry == '..') }
		for dir2 in dir1
			if dir2 
	else
		File.open("Susb.txt", 'a') {|f| f.write(dir) } 
end
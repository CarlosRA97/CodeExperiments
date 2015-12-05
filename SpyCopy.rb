#!/usr/bin/env ruby

require 'fileutils'

FileUtils.copy_entry '/media/ESD-USB/Copy', '/home/carlos/Copy'

Dir.entries('/your_dir').select {|entry| File.directory? File.join('/your_dir',entry) and !(entry =='.' || entry == '..') }
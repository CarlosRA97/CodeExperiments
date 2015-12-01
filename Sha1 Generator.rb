#!/usr/bin/env ruby

require 'OpenSSL'

key = gets.chomp

digest = OpenSSL::Digest.new('sha1', key)

puts digest

def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
  str
end

pbcopy digest
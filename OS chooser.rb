#!/usr/bin/env ruby

module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  #def OS.unix?
  #  not OS.windows?
  #end

  def OS.linux?
    not OS.windows? and not OS.mac?
  end
end

puts OS.windows?
puts OS.mac?
puts OS.linux?
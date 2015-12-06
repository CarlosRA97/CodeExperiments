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

def osC(RUBY_PLATAFORM)
	if OS.windows? == RUBY_PLATAFORM
		src = 'C:'
		dest = 
	if OS.mac? == RUBY_PLATAFORM
		src = '/Volumes'
		dest = '/Users/Carlos/Downloads'
	else
		src = '/media'
		dest = '/home/carlos/Escritorio'
	end
	return src,dest
end
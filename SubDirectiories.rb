def windows?
	(/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RbConfig::CONFIG["host_os"]) != nil
end
def mac?
	(/darwin/ =~ RbConfig::CONFIG["host_os"]) != nil
end
def linux?
	not windows? and not mac?
end

src = "G:" if windows?
dest = "C:\Users\Sabino\Descargas" if windows?

src = "/Volumes/ESD-USB" if mac?
dest = "/Users/Carlos/" if mac?

src = "/media" if linux?
dest = "/home/carlos/" if linux?

x = gets.chomp

subDir = "**/" * x

src2 = Dir.glob File.join(src,subDir)
puts src2
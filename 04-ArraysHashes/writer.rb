#!/usr/bin/ruby -w

# writer.rb
#
# Written by Jason A. Heppler for
# the Rubyist Historian ebook project
#
# Last Modified: Sun Jan  2 21:15:07 CST 2011

file = File.new("my_file", "w")

file.write("Hello, world!")
file.write("\n")
file.write("Goodbye, world!")

file.close()

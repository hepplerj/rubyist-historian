#!/usr/bin/ruby -w

# file.rb
#
# Written by Jason A. Heppler for
# the Rubyist Historian ebook project
#
# Last Modified: Sun Jan  2 21:13:38 CST 2011

File.open("letter.txt", "r") do |file|  # open the file and assign to variable 'file'
    
    line_array = file.readlines() # read every line in the file and create an array

    puts line_array[3]
    puts line_array[5]
    puts line_array[9]
end

# Since we used the "r" specifier, Ruby will automatically close the
# file.  Otherwise, you will need to exit the file using file.close().

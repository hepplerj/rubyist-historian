#!/usr/bin/ruby -w

# fileLines.rb

File.open("letter.txt", "r") do |file|  # open the file and assign to variable 'file'
 
    line_array = file.readlines
 
    puts line_array[3]
    puts line_array[5]
    puts line_array[9]
end
 
# Since we used the "r" specifier, Ruby will automatically close the
# file.  Otherwise, you will need to exit the file using file.close().

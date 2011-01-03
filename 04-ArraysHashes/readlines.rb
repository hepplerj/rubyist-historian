#!/usr/bin/ruby -w

# readlines.rb
#
# Written by Jason A. Heppler for
# the Rubyist Historian ebook project
#
# Last Modified: Sun Jan  2 21:14:26 CST 2011

File.open "letter.txt", "r" do |file| # open the file
    line_array = file.readlines() # read the lines of the file
    words = Array.new()
        line_array.each do |line|
            split_line = line.split(/ /) # split the words apart
            split_line.each { |word| word.chomp! }
            words.push split_line # push the new array onto split_line
    end

    words.flatten!
    words.uniq!
    words.each { |word| puts word } # print results
end

#!/usr/bin/ruby -w

# freqExport.rb

require 'open-uri'
 
def readFile(url)
 
    # Strip out HTML tags, alphanumeric characters, and punctuation, lower-case 
    # all words, and split the words apart 
    uri_file = open(url).read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'""':.)]/, '').downcase.split(' ')
 
    return uri_file
 
end
 
# create a dictionary of n-grams
 
url = ARGV[0]
uri_file = readFile(url)
 
# print output to HTML file
 
File.open("output.html", "w") do |output|
        frequency = Hash.new(0)
        uri_file.each { |word| frequency[word] += 1 }
        frequency.sort_by { |x,y| y }.reverse().each do |w,f| 
            output.write "<p>#{f}, #{w}</p>\n"
    end
end
 
puts "\nFile exported to #{Dir.pwd}.\n"

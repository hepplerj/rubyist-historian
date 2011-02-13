#!/usr/bin/ruby -w
 
# FREQr.rb
#
# Written by Jason A. Heppler
#
# This program is free software.
# You can distribute/modify this program under the terms of
# the GNU Lesser General Public License version 2.1.
# 
# Last Modified: Mon Jan 10 23:15:08 CST 2011
 
require 'open-uri'
 
STOPWORDS = %w{a about above across after again against all am an and any are arent as at be because been before being below between both but by cant cannot could couldnt did didnt do does doesnt doing dont down during each few for form further had hadnt has hasnt have havent having he her here heres hers herself him himself his how i id ill im ive if in into is isnt it its itself lets me more most mustnt my myself my myself no nor not of off on once only or other ought our ours ourselves out over own same shant she should shouldnt so some such than that the their theirs them themselves then there these they this those through to too under until up very was we were what when where which while who why with would you your yours yourself yourselves}
 
# Strip out HTML tags, alphanumeric characters, and punctuation, then 
# lower-case all words, split the words apart, and remove stopwords 
def readFile(url)
 
    uri_file = open(url).read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'""':.)]/, '').downcase.split(' ') - STOPWORDS
 
    return uri_file
 
end
 
# Create a dictionary of n-grams
url = ARGV[0]
uri_file = readFile(url)
 
# Save output to HTML
File.open("output.html", "w") do |output|
        frequency = Hash.new(0)
        uri_file.each { |word| frequency[word] += 1 }
        frequency.sort_by { |x,y| y }.reverse().each do |w,f| 
            output.write "<p>#{f}, #{w}</p>\n"
    end
end
 
# Give the user an exported-to message
puts "\nFile exported to #{Dir.pwd}.\n"

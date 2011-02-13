#!/usr/bin/ruby -w

# frequency

require 'open-uri'
 
def readFile(url)
 
    # Strip out HTML tags, alphanumeric characters, and punctuation, lower-case 
    # all words, and split the words apart 
    uri_file = open(url).read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'""':.)]/, '').downcase.split(' ')
 
    return uri_file
 
end
 
# create a dictionary of n-grams
 
url = "http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml"
uri_file = readFile(url)
 
#print uri_file
 
frequency = Hash.new(0)
uri_file.each { |word| frequency[word] += 1 }
frequency.sort_by { |x,y| y }.reverse.each { |w,f| puts "#{f}, #{w}" }

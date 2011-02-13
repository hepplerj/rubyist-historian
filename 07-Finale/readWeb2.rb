#!/usr/bin/ruby -w

# readWeb2.rb

require 'open-uri'
 
uri_file = open("http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml").read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'":.)]/, '').downcase.split(' ')
 
frequency = Hash.new(0)
uri_file.each { |word| frequency[word] += 1 }
frequency.sort_by { |x,y| y }.reverse().each { |w,f| puts "#{f}, #{w}" }


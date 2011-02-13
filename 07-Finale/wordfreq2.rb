#!/usr/bin/ruby -w

# wordfreq2.rb

filename = File.new("text.txt", "r").read().downcase().scan(/[\w']+/)
frequency = Hash.new(0)
filename.each { |word| frequency[word] += 1 }
frequency.sort_by { |x,y| y }.reverse().each { |w,f| puts "#{f}, #{w}" }

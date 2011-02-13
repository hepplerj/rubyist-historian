#!/usr/bin/ruby -w

# wordfreq.rb

# frequency.rb
 
def separation(string)
    string().downcase().scan(/[\w']+/) # downcase and strip out white space
end
 
def word_count(elements)
    number = Hash.new(0)
    for word in elements
        number[word] += 1
    end
 
    number
 
end
 
text = File.read("text.txt")
elements = separation(text)
number = word_count(elements)
sorted_list = number.sort_by { |word, count| count }
 
most_to_fewest.each { |word, count| puts "#{count}  #{word}" }

#!/usr/bin/ruby -w

# linguistics.rb

# linguistics.rb
 
require 'rubygems'
require 'linguistics'
 
# tell linguistics to use English
Linguistics::use( :en )
 
puts 185934538450.en.numwords
# => one hundred and eighty-five billion, nine hundred and thirty-four million, five hundred and thirty-eight thousand, four hundred and fifty

"goose".en.plural
# => "geese"

animals = %w{dog cow ox chicken goose goat cow dog rooster llama pig goat dog cat cat dog cow goat goose goose ox alpaca}
puts "The farm has: " + animals.en.conjunction
# => The farm has: four dogs, three cows, three goats, two oxen, two geese, two cats, a chicken, a rooster, a llama, a pig, and an alpaca

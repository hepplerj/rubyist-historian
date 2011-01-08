#!/usr/bin/ruby -w

# linguistics.rb

require 'rubygems'
require 'linguistics'

Linguistics::use( :en )

animals = %w{dog cow ox chicken goose goat cow dog rooster llama pig goat dog cat cat dog cow goat goose goose ox alpaca}
puts "The farm has: " + animals.en.conjunction


#!/usr/bin/ruby -w

# colors-pop.rb
#
# Written by Jason A. Heppler for
# the Rubyist Historian ebook project
#
# Last Modified: Sun Jan  2 21:06:35 CST 2011

colors = ["red", "blue", "green"]

foo = puts colors.pop
foo2 = puts colors.shift

puts foo # => prints "green"
puts foo2 # => prints "red"


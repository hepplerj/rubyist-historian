#!/usr/bin/ruby -w

# hash.rb
#
# Written by Jason A. Heppler for
# the Rubyist Historian ebook project
#
# Last Modified: Sun Jan  2 21:11:26 CST 2011

instruments = {
    'cello'      =>   'string',
    'clarinet'   =>   'woodwind',
    'drum'       =>   'percussion',
    'oboe'       =>   'woodwind',
    'trumpet'    =>   'brass',
    'violin'     =>   'string'
    # key        =>    value
}

puts instruments['cello']
puts instruments['oboe']
puts instruments['trumpet']

#!/usr/bin/ruby -w

# authorHash.rb

authors = {
    'Hemingway'     => 'five_stars',
    'Stephenson'    => 'four_stars',
    'Heppler'       => 'one_star',
    'Whitman'       => 'five_stars'
    # key   => value
}

puts authors['Whitman'] # => five_stars
puts authors['Stephenson'] # => four_stars

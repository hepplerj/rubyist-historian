#!/usr/bin/ruby -w

# array-shortcut.rb
#
# Written by Jason A. Heppler for
# the Rubyist Historian ebook project
#
# Last Modified: Sun Jan  2 21:10:20 CST 2011

a = [ 'Apple', 'Microsoft', 'Linux', 'Solaris' ]
a[0] # => "Apple"
a[1] # => "Microsoft"

# we can achieve the same thing by using:

a = %w{ Apple Microsoft Linux Solaris }
a[0] # => "Apple"
a[1] # => "Microsoft"


#!/usr/bin/ruby -w

# stripWeb.rb

require 'open-uri'
 
# read a URL, strip out HTML tags, and assign the file to a variable
uri_file = open("http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml").read().gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "\""/)
 
puts uri_file

#!/usr/bin/ruby -w

# readWeb.rb

require 'open-uri'
 
uri_file = open("http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml").read()
 
puts uri_file

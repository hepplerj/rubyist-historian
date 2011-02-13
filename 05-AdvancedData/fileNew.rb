#!/usr/bin/ruby -w

# fileNew.rb

file = File.new("my_file.txt", "w")
 
file.write("Hello, world!")
file.write("\n")
file.write("I'm learning Ruby!")
 
file.close()

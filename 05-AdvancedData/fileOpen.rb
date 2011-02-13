#!/usr/bin/ruby -w

# fileOpen.rb

File.open("letter.txt", "r") do |file|
    lines = file.readlines
    puts lines
end

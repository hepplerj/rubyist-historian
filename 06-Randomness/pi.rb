#!/usr/bin/ruby -w

# pi.rb

loop do
 
    PI = 3.141592
 
    puts "Enter a radius to calculate: "
    radius = gets.chomp.to_f
 
    area = PI * (radius**2)
    area = "%.4" % area
    puts "The area of the circle is: #{area}"
 
    circ = 2 * radius * PI
    circ = "%.4" % circ
    puts "The circumference of the circle is: #{circ}"
 
    break
 
end

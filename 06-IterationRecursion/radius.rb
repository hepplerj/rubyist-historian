#!/usr/bin/ruby -w

# radius.rb

loop do

    PI = 3.141592

    puts "Enter a radius to calculate: "
    radius = gets().chomp().to_f

    area = PI * (radius**2)
    area = "%.4f" % area
    puts "The area of the circule is: #{area}"

    circ = 2 * radius * PI
    circ = "%.4f" % circ
    puts "The circumference of the circule is: #{circ}"

    break

end

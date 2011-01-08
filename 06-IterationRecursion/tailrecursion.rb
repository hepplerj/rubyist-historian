#!/usr/bin/ruby

# tailrecursion.rb

def tailFactorial(n, result)
    if n == 1
        return result
    else
        tailFactorial((n-1), (result * n))
    end
end

def factorial(n)
    if n == 1
        return 1
    else
        return n * factorial(n-1)
    end
end

puts "Here is a tail recursive approach:\n"
puts tailFactorial(8,1)

puts "\n"

puts "Here is a tree recursive approach: "
puts factorial(8)

# we'll also compare computation times
puts "\nExecution times\n"
puts "Tree recursion: \n"
st = Time.now
result = factorial(8)

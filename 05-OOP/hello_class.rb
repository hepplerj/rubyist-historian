#!/usr/bin/ruby -w

# hello_class.rb
#
# Written by Jason A. Heppler for
# the Rubyist Historian ebook project
#
# Last Modified: Sat Jan  8 14:28:51 CST 2011
 
# define the class 'hello'
class Hello 
 
    def exclaim()
        puts "hello world!"
    end
 
    def question()
        puts "hello world?"
    end
 
    def omit()
        puts "hello world . . ."
    end
 
end
 
# we call a new instance of the class with a constructor
hello = Hello.new 
 
# we create three objects with different initial states
hello.exclaim()
hello.question()
hello.omit()


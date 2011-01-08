#!/usr/bin/ruby -w

# inheritance.rb
#
# Written by Jason A. Heppler for
# the Rubyist Historian ebook project
#
# Last Modified: Sat Jan  8 14:29:56 CST 2011
 
class Animal
 
    def make_noise
        return "Quack!"
    end
 
    def sleep
        print self.class.name + " is sleeping.\n"
    end
 
end
 
# Dog is a subclass of Animal, or Animal is a superclass of Dog                      
# the lower class inherits all the properties of the superclass
class Dog < Animal
 
    def make_noise
        return "Woof!"
    end
 
end
 
class Ostrich < Animal
 
    def sleep
        puts "I am a sleeping ostrich"
    end
 
end
 
class Cat < Animal
 
    def make_noise
        return "Meow!"
    end
 
end
 
# we'll create an array that contains an unnamed object
# type Dog, type Cat, and type Ostrich
animals = [Dog.new, Cat.new, Ostrich.new]
 
animals.each do |a|
    print a.make_noise + "\n"
    a.sleep
end

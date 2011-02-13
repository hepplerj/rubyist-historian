#!/usr/bin/ruby -w

# library.rb

class Books

    attr_accessor :fname, :lname, :isbn

    def initialize( fname, lname, isbn )
        @fname = fname
        @lname = lname
        @isbn = isbn
    end

    def to_s
        @lname + ", " + @fname + ", ISBN: " + @isbn
    end

end

author = Books.new("Walt", "Whitman", "1234567890")
puts author

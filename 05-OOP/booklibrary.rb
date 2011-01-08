#!/usr/bin/ruby -w

# booklibrary.rb

class BookLibrary

    def initialize(isbn, date)
        @isbn = isbn
        @date = date
    end

end

book1 = BookLibrary.new("isbn1", "2011-01-01")
p book1
book2 = BookLibrary.new("isbn2", "2011-01-01")
p book2
book3 = BookLibrary.new("isbn2", "2011-01-01")
p book3

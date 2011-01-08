#!/usr/bin/ruby -w

# booklibrary2.rb

class BookLibrary
    attr_reader :isbn, :date

    def initialize(isbn, date)
        @isbn = isbn
        @date = date
    end

end

book = BookLibrary.new("isbn1", "2011-01-01")
puts "ISBN  =   #{book.isbn}"
puts "Date  =   #{book.date}"

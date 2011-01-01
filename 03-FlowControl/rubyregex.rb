#rubyregex.rb

target = 'I am a humanities-junkie vampire.'

pattern = Regexp.new(/[Hh]umanities-/)

# anything found between forward slashes is an 
# object of type Regular Expression
#pattern = /[Hh]umanities-/

# substituting object of type string
foo = target.sub(/[Hh]umanities-/, "unicorn-")

puts target
puts foo

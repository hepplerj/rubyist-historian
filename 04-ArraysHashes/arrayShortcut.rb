# arrayShortcut.rb
 
a = [ 'Apple', 'Microsoft', 'Linux', 'Solaris' ]
a[0] # => "Apple"
a[1] # => "Microsoft"
 
# we can achieve the same thing by using:
 
a = %w{ Apple Microsoft Linux Solaris }
a[0] # => "Apple"
a[1] # => "Microsoft"

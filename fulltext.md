# The Rubyist Historian
## Ruby Programming for Humanities Scholars

In late 2010 I wrote a post on [how I learned code](http://www.jasonheppler.org/2010/12/03/how-i-learned-code.html). I was, simultaneously, enrolled in ENGL4/878: Electronic Text with Professor Stephen Ramsay, where part of the course was about learning the Ruby programming language and how we could apply programming to humanistic data. The course, it turns out, was a sort of pivot moment for me. Although I had always been something of a computer geek, programming was something I had not touched since high school. But after the course I became captured by the power that programming can offer humanities scholars. In an age of Big Data, from Google Books to ever-growing cultural heritage digitized by libraries, museums, and centers, we have at our hands a vast array of material that can be manipulated, queried, browsed, and visualized through computational methods. When the course was finished, I decided to write a series of blog posts for others who might be interested in applying Ruby to humanistic questions. The result was the seven write-ups below.

The original post promised that the series would be released as an electronic book. At the time I wrote the series I was running WordPress and the plugin [Anthologize](http://anthologize.org/) had recently been released. Shortly after, however, I switched blog platforms to Jekyll and, as other projects demanded my attention, I never got around to pushing the material into a format beyond my blog posts.

But I had a new idea. Instead of pushing out a static project as a PDF or epub format I decided to host things dynamically. Starting today (2012-05-21) I am pushing all posts to Github and hosting the series on Github pages. Anyone interested can now download a copy of The Rubyist Historian to use.

I want more, however. As a bit of an experiment in open publishing, I've decided to open source The Rubyist Historian for public contributions. People are free to fork The Rubyist Historian and offer corrections, clearer (or better, or more) examples, and overall contribute to what I want to become a collaborative project and reference for humanities scholars looking to get started with Ruby programming.

As before, copies of the example code (and now the full text) can be found at the [Rubyist Historian Github repository](https://github.com/hepplerj/rubyist-historian).

### Contents

1. [Getting Started](http://www.jasonheppler.org/2010/12/29/the-rubyist-historian-getting-started.html)
2. [Methods and Classes](http://www.jasonheppler.org/2010/12/31/the-rubyist-historian-more-basics-methods.html)
3. [Loops and Control Structures](http://www.jasonheppler.org/2011/01/02/the-rubyist-historian-flow-control.html)
4. [Arrays and Hashes](http://www.jasonheppler.org/2011/01/04/the-rubyist-historian-arrays-hashes-and-more-io.html)
5. [Working with Advanced Data](http://www.jasonheppler.org/2011/01/07/the-rubyist-historian-working-with-advanced-data.html)
6. [Randomness](http://www.jasonheppler.org/2011/01/08/the-rubyist-historian-iteration-recursion-and-other-randomness.html)
7. [Our First Program](http://www.jasonheppler.org/2011/01/12/the-rubyist-historian-our-first-program.html)

*Note the links above return you to my website. Use the Github pages navigation to the left to jump to sections.*

### Acknowledgements

The structure, examples, and topics that comprise this blog series are directly inspired by and drawn from Prof. Stephen Ramsay's course ENGL 4/878: Electronic Text, which I took during the Fall 2010 term at the University of Nebraska-Lincoln. Thanks, Steve, for encouraging the hacker in all of us. Any mistakes, errors, or lousy explanations are my responsibility alone.

Many thanks to additional resources I consulted for example ideas and help with explanations. These resources include Dave Thomas, *[Programming Ruby 1.9: The Pragmatic Programmer's Guide](http://www.amazon.com/gp/product/1934356085?ie=UTF8&tag=jasohepp-20&linkCode=as2&camp=1789&creative=9325&creativeASIN=1934356085)*, [The Unofficial Ruby Usage Guide](http://www.caliban.org/ruby/rubyguide.shtml), and [Ruby Inside](http://www.rubyinside.com/). Other resources are included with each section.


## Getting Started

The purpose of this ebook is to provide a brief overview of the Ruby programming language and consider ways Ruby (or any other programming language) can be applied to the day-to-day operations of humanities scholars. Once you complete this book, you should have a good understanding of Ruby basics, be able to complete basic tasks with Ruby, and hopefully leave with a solid basis that will allow you to continue learning.

The best way to learn Ruby is not by reading this book. The best way to learn any programming language is by hands-on interaction. As you read through the lessons and exercises, I encourage you to write the programs in your own text editor and run them; figure out how things fit together, try changing things in the program, learn what those changes break or improve and understand the reason behind it. Some exercises in this book may seem trivial, others quite complex. My goal is to provide a foundation to help those new to programming (or even those with basic or advanced experience) become comfortable with programming. And don't stop here. I'm barely touching the surface of what can be done with Ruby. I'll point out some additional resources to encourage the burgeoning Ruby enthusiast inside of you as we go along.

Before going any further, I want to thank [Prof. Stephen Ramsay](http://english.unl.edu/faculty/profs/sramsay.html) at the University of Nebraska for being the inspiration for this series. The structure of these posts, the topics of discussion, and some of the examples are directly correlated with his course I took in the Fall of 2010, ENGL 4/878: Electronic Text. Thanks, Steve, for encouraging the hacker in all of us.

### Why Ruby?
So why am I writing about Ruby? Why not some of the other languages I know, such as Python? Or web language like PHP? I'm not suggesting here that Ruby is "the best" language but rather I hope to briefly sketch out the reasons why I think Ruby works as a beginner programming language.

All programming languages, like any foreign language, necessarily contain a learning curve. For example, we could compare PHP with Ruby: they have similar structures, syntaxes, and the like, but PHP sometimes throws in syntaxes that require careful distinctions (the difference between <code>sprintf</code> and <code>printf</code>). I believe that simplicity in the syntax of a language makes a huge difference in beginning programmers to grasp concepts. I also greatly appreciate Ruby's simplicity. I'm going to jump slightly ahead for the sake of making a comparison. Let us say we wanted to create an array of authors for a bibliographic program. In PHP, you might write:

```php
$authors = array("Hemingway" => 3, "Dickinson" => 1, "Whitman" => 2);
$keys = array_keys($authors);
sort($keys);
$sorted = array_slice($keys, 0, 3);
```

We can achieve the same thing in Ruby much more simply:

```ruby
authors = { "Hemingway" => 3, "Dickinson" => 1, "Whitman" => 2 }
sorted = authors.keys().sort().slice(0,3)
```

Don't worry so much here about what exactly is going on, we'll get to that later. But notice how much easier this is to read. This has something to do with Ruby being a pure OOP (object-oriented programming) language versus PHP's bolt-on functionality. The result is Ruby code that is much more readable. But we're getting ahead of ourselves. The point here is to illustrate the simplicity of the Ruby language.

Ruby also handles blocks well. Once again, lets compare PHP and Ruby. Imagine we wanted to sort a list of authors. In PHP, we would write:

```php
function sort_authors_by_count($a, $b)
 {
   if($a -> counts == $b -> counts)
   {
     return 0;
   }
   return($a -> counts > $b -> counts) ? +1 : -1;
 }

 usort($authors, "sort_authors_by_count");
```

Ruby blocks are chunks of code between <code>do . . . end</code>. The Ruby syntax would look like this:

```ruby
authors.sort do |a, b|
   a.counts <=> b.counts
end
```

Once again, Ruby is much simpler. Even if you're not exactly sure what is happening, it is much easier to look up the Ruby syntax of <code><=></code> rather than try and decipher <code>? +1 : -1</code>.

Finally, everything in Ruby is an object. Ruby was designed as an object-oriented language, which makes writing programs much easier to create. Having everything as an object also makes code easier to handle. There's no need to check and see if something is an object and execute methods upon it. You can simply execute a method. Just as everything is an object, the results of manipulations on an object are also objects. There will be more on this later.

We could also ask a broader question, related to the first: why program? Why should historians take the time to learn to program? My answer is in line with Douglas Rushkoff's general warning: [program or be programmed](http://www.orbooks.com/our-books/program/). Using tools developed by others puts you at their mercy. Much of our scholarly lives have already become digital: our sources are in digital form, we write in word processors, we communicate through e-mail and Twitter, we place lecture notes on Blackboard, we extend classrooms with blogs. We use these tools without really understanding how they do what they do. I'm offering a glimpse into this world and hopefully equipping you with a set of tools that will be readily useful in your scholarly work.

Wayne Graham has an [entire list](http://www.scholarslab.org/slab-code/why-ruby/) of why Ruby makes a great beginner language that I would also recommend checking out.

### The Setup

I'm writing this for people who have access to a UNIX environment. If you are on Linux or Mac, you have this accessible to you already: simply fire up the terminal and you're ready to go. Ruby comes preinstalled on most Linux distributions and on Mac OSX 10.5+. On Windows, you'll want to download Cygwin, a UNIX-like environment for Microsoft Windows. UPDATE: Reader Gordon Thiesfeld recommends Windows users check out [RubyInstaller](http://rubyinstaller.org/) over Cygwin.

You'll also need a good text editor that you know your way around in. I work almost entirely in vim (or mvim). You might check out emacs or nano, or do your programming outside the terminal using TextMate (Mac), gEdit (Linux), or Notepad++ (Windows), or any other number of text editors. I would encourage you to find an editor that handles syntax highlighting, if only for making the code easier to read. And [get ready for some battles](http://xkcd.com/378/).

You could also set up an IDE, or integrated development environment. I would follow the steps in William Turkel's [The Programming Historian](http://niche-canada.org/programming-historian) to install Komodo Edit (but ignore the extensions for Firefox), with a few changes for the appropriate programming language. I can also highly recommend NetBeans as a really useful IDE system if you prefer this route. I won't be going through that setup here -- if you really want the instructions, drop me an email.

### Our First Program

Let's get started! It is traditional to start programming in a new language by writing something that says "hello world" and terminates. The language we are using is interpreted (as opposed to compiled), meaning that a special computer program known as an interpreter reads the instructions from Ruby and then runs the program. There are two ways to run Ruby. The first is by running Ruby interactively in the shell prompt. Simply type <code>irb</code> into the command line to open the Ruby shell. Simply type in Ruby code and it will return the value of expressions under evaluation. Exit <code>irb</code> by typing <code>exit</code> or using the end-of-file character on your OS (normally Ctrl+D or Ctrl+Z). Alternatively, you can write these programs as files to your local disk or to a server and run them through the terminal. This is the preferred method for writing Ruby programs. In my case, I'll be running these programs locally through the terminal. I'll demonstrate briefly how <code>irb</code> works and looks, but all subsequent examples and programs will be written as files.

Continuing with our comparative approach, generating "hello world" is a fairly straightforward process in many languages. In PHP, it looks like this:

```php
print("Hello world");
```

Ruby operates similarly:

```ruby
puts "Hello world"
```

If you're running this in the interactive Ruby shell, you should see something like this:

```ruby
irb(main):001:0> puts "Hello world"
Hello world
=> nil
```

If you're running Ruby files off a server or local disk, save the file as <code>hello.rb</code> and in the terminal run:

```console
ruby hello.rb
```

Note the lack of parens in my <code>puts</code> function. Parentheses are absolutely accepted Ruby syntax, but you must make a choice between a parens or a space. <code>puts("Hello world")</code> and <code>puts "Hello world"</code> are the same thing, but you cannot do <code>puts ("Hello world")</code>. I tend to leave out parentheses unless I'm passing variables through a method.

It is common practice to also include the "shebang" notation (<code>#!</code>) in the first line of the program, followed by introductory comments that usually include the name of the file, a description of what the program does, who wrote it and for what, and when it was last modified. Commented text is marked by <code>#</code>. For example, a "hello world" program might look like this:

```ruby
#!/usr/bin/ruby -w

# helloworld.rb
#
# Basic "hello world" program
#
# Written by Jason A. Heppler for
# The Rubyist Historian ebook project
#
# Last modified: Tue Dec 28 21:21:43 -0600 2010

puts "Hello, world!"
puts "I became a Ruby programmer on #{Time.now}"
```

Running <code>ruby helloworld.rb</code> in the terminal will return:

```console
Hello, world!
I became a Ruby programmer on Tue Dec 28 21:21:43 -0600 2010
```

And there you have it, your first Ruby program! But let's make things a little more interesting. Instead of just pushing static data, let's have Ruby work with data we give it through what's known as <a href="http://en.wikipedia.org/wiki/Standard_streams">standard streams</a>. For this we're going to use the methods gets() and chomp():

```ruby
puts "Please enter your name: "
name = gets().chomp()

puts "I, #{name}, began learning Ruby code on #{Time.now}."
```

This will print to the screen:

```highlight
I, Jason, began learning Ruby code on Tue Dec 28 21:21:43 -0600 2010.
```

Note the new notation <code>#{}</code>. By asking for an input we are using what is called <strong>interpolation</strong>, or passing a variable into a string. Variables are enclosed in <code>#{<em>var</em>}</code>. Take note that strings can be marked off by single or double quotes, but there is a distinction between their use. In order to interpolate, you must use double quotes. Single quotes will not allow interpolation, which has to do with Ruby attempting to optimize the code and [redacted boring technical jargon].

There you go! Your first Ruby program that works with user data. Up next, we're tackling methods and classes.

### Additional Resources

- [Ruby in Twenty Minutes](http://www.ruby-lang.org/en/documentation/quickstart/)
- [Understanding Ruby Basics](http://patcanella.com/post/2134954107/understanding-ruby-basics)

## Methods and Classes

In our last section I introduced some Ruby programming basics. Now we're moving in to methods and classes.

### Methods

Notations like <code>gets()</code> and <code>chomp()</code> are called <strong>methods</strong>. In our above example, <code>gets()</code> accepts a single line of data from the user and assigns the string to <code>name</code>. So how can we know what methods are available to us as programmers? The all-knowing, all-powerful <a href="http://www.ruby-doc.org/">Ruby Docs</a>. <code>gets</code> and <code>chomp</code> barely scratch the surface. We can do things like count the number of characters or lines in a string or file, reverse the lines of a string or file, cut a string apart and join it in alphabetical order, or operate all methods on it at once. For example:

```ruby
puts "I am a Rubyist Historian".length() #=> 24
puts "Learning some Ruby-fu".reverse() #=> uf-ybuR emos gninraeL
puts "Ruby is fracking awesomesauce.".split("").sort().join() #=>  .Raaabcceeefgiikmnorsssuuwy
```

Run this in the terminal and you should get the commented results. For the first example, we would technically say that we are <em>invoking the length method on object "I am a Rubyist Historian."</em> (Or, even more abstractly, "I am a Rubyist Historian" is an <em>object of type string</em>.) Everything before the period is the <strong>receiver</strong> while everything after the period indicates the <strong>method(s)</strong> you wish to invoke upon the object.

We can also create methods. We'll return to our original "hello, name" program. But this time we're going to write our own method and invoke it. Methods are defined with the keyword <code>def</code> followed by the method name and the method's parameters between parentheses (parentheses here are optional, but I use them for readability's sake. Remember, if you do not use parentheses you need to have a single space in its place, e.g., <code>name hello</code> is the same as <code>name(hello)</code>). So to build a new "hello, name" program using a defined method, we could write:

```ruby
# defining function 'hello' to ask
# for parameter 'name'
def hello(name)
  'Hello ' + name
end

puts "Please enter your name: "
name = gets.chomp

puts hello(name)
```

NB: Indentations does not matter to Ruby, but for readability's sake, we include them.

Become very familiar with defining functions. This allows us to define functions for later use and set code apart to keep the program organized (as Prof. Steve Ramsay persistently reminded us in his course, programs are designed for <em>people</em> to read, not just computers). You also want to avoid redundancy. As a final note, what happens inside of functions is not visible outside the function. We can make things visible by using the global variable (adding $ to the beginning of the variable you want visible, e.g., <code>$result</code>) but, as Prof. Ramsay warned us: <strong>global variables are evil</strong>. No, really, <strong>they are</strong>. The last thing you'll want is a global variable to plague parts of your code without your knowledge.

### Classes

Similarly to methods, we can define classes in Ruby. Recall that Ruby is an object oriented programming language. By using classes, we're fully entering the realm of OOP and learning how to create our own objects. We know that objects are closely allied with a type (object of type string, for example) and that certain behaviors go with certain objects. Objects are a data structure and a state, and also have behaviors that we call methods.

Ruby classes are templates for creating new kinds of objects. Classes are created by using the <code>class</code> keyword, and take note that classes are capitalized and methods are lowercase. By using OOP we are making data central through what's called <strong>procedural programming</strong> where we're defining relationships between and among objects.

Let's say you wanted a program that allowed you to input author names and ISBNs. First we define the class starting off the definition with <code>class</code> followed by the class name, capitalized:

```ruby
class Books
  # . . .
end
```

We'll use the <code>initialize</code> method here, which allows programmers to set the state of constructed objects. We store these as <strong>instance variables</strong> inside the object, which we incidate through the use of the <code>@</code> symbol. This makes variables visible within a class -- this is <strong>not</strong> a global variable. But the instance variables means we can allow each object to have its own unique state. <code>initialize</code> is a special method in Ruby. Ruby allocates memory to hold <code>uninitialized</code> objects and then calls the object's <code>initialize</code> method. The method passes any parameters that were passed to <code>new</code>. 

Enough talk, let's write the code and explain things further:

```ruby
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
```

What we've done here is passed the instance variables <code>@fname</code>, <code>@lname</code>, and <code>@isbn</code> a string by calling the class constructor <code>Books</code> (<code>Books.new("Walt", "Whitman", "1234567890")</code>). We could just as easily said <code>Books.new("William", "Shakespeare", "1234567890")</code>. Note that <code>attr_accessor</code> is not declaring an instance variable, it's only creating the accessor methods. Ruby decouples instance variables and accessor methods.

The class <code>Books</code> takes three variables, <code>fname</code>, <code>lname</code>, and <code>isbn</code>. These parameters act like local variables within the method and follow the same lowercase naming convention. Yet, if we kept them as local variables they would vanish once <code>initialize</code> returned. So, we use an accessor to keep the variables usable throughout the class.

Note also that we redefined the <code>to string (.to_s)</code> type cast as well. By default, when Ruby uses <code>puts</code> it calls on the <code>.to_s</code> type cast to convert data into a string. But we want <code>.to_s</code> to be more useful. We can override the default implementation to display whatever we'd like it to display.

### Additional Resources

- [Ruby Class Tutorial](http://juixe.com/techknow/index.php/2007/01/22/ruby-class-tutorial/), Juixe Techknow

## Loops and Control Structures

Our last segment introduced us to Ruby methods and classes. This section will introduce you to expressions and loops. Loops are, put simply, a test of whether an expression is true or false. This is the basic way that computer's operate: continue following a set of instructions until the expression becomes true, then end or move on to the next set of instructions.

### while . . . end

Let's say we needed a program that printed numbers until it reached five. In this case, we want the program to print a number, evaluate whether that number is equal to five, if not add one and run the program again. Once the number is equal to five, the program terminates. We achieve this through the use of the <code>while . . . end</code> loop:

```ruby
num = 0

while num < 5
  puts num
  num += 1
end
```

Running <code>ruby loop.rb</code> in the terminal will produce:

```console
0
1
2
3
4
```

Note the <code>+=</code> above. This symbol is called an <strong>operator</strong>, which allow us to compare values.

<strong>Example Operators</strong>
<table border="0" width="100%" cellpadding="3" cellspacing="3">
	<tr>
		<td>==</td>
		<td>Test for equal value.</td>
	</tr>
	<tr>
		<td width="20%"><, <=, >=, ></td>
		<td>Comparison operator for less than, less than or equal, greater than or equal, and grater than</td>
	</tr>
	<tr>
		<td><=></td>
		<td>Returns -1, 0, or +1 depending on whether the receiver is less than, equal to, or greater than its argument.</td>
	</tr>
	<tr>
		<td>-=</td>
		<td>Subtraction operator.</td>
	</tr>
	<tr>
		<td>*=</td>
		<td>Multiplication operator.</td>
	</tr>
    <tr>
		<td>!=</td>
		<td>Not equal to operator.</td>
	</tr>
</table>

### if . . . elsif . . . else

The <code>if . . . else</code> loop allows us to evaluate several branches of code in the order we write it. If the first branch is false, the program moves on to the next and the next and so on until the value is true and terminates the program. We could write a program that evaluates what a user thinks about the quality of a book, for example:

```ruby
puts "Enter a rating between one and five: "

# we use .to_i to convert the string to an integer
rank = gets.chomp.to_i

if rank >= 4
  puts "The book was good!"
elsif rank == 3
  puts "The book was so-so."
elsif rank <= 2
  puts "The book stinks."
end
```

Pro Tip: If you get stuck in a loop and the terminal won't quit printing to the screen, hit CTRL+C. CTRL+C tells the terminal to stop whatever it's working on.

### Iterators

So far we've looked at some pretty primitive versions of loop constructs. Unlike Java, C, and C++, Ruby doesn't have a <code>for</code> loop. Instead, it uses a less error-prone, built-in class functionality called <strong>iterators</strong>. Let's say you just finished writing a section of a chapter and wanted some applause for your effort. We could write a program to do that for you:

```ruby
3.times do 
  print "Clap! "
end
```

Run the program from the terminal and it will produce:

```console
Clap! Clap! Clap!
```

There, now you and your computer just shared a special moment. A pretty simple block of code, right? You could read what the program is doing even if you didn't understand a single line of Ruby: print "Clap!" three times, no more, no less. Simplicity.

We can also use iterators to loop through ranges. Let's return to our number counter example above and write an iterator to print numbers between one and five:

```ruby
0.upto(5) do |x|
  print x, " "
end
```

The most basic iterator in Ruby is simply <code>loop</code>, which will run the block forever until you break out of the loop:

```ruby
loop do
  print "85098357-198058903028340jj23u0280234itj3"
  # it's just like the Matrix!
end
```

Hit CTRL+C to break the loop.

### Blocks

Blocks contains a chunk of code normally enclosed between braces or within <code>do</code> and <code>end</code>. The prevailing style is to use the braces for blocks that fit on a single line and <code>do . . . end</code> for multiple lines. Blocks are called only after the invocation of some method. We could, for example, write a program that sums the squares of numbers inside of an array:

```ruby
sum = 0

[2, 4, 6, 8].each do |value|
  square == value * value
  sum += square
end 

puts sum
```

In this example, the block is being called by the <code>each</code> method once for each element in the array. The element passed as the parameter is <code>value</code>. Note also that although <code>sum</code> is defined outside of the block, it is also being modified within the block and then passed on to <code>puts</code>. If a variable is inside a block with the same name as a variable outside of the block the two are the same, but if a variable appears only inside a block than the variable is local to the block.

As extra reading, I would check out Steve Ramsay's <a href="http://etext.lib.virginia.edu/services/helpsheets/unix/regex.html">guide to regular expressions</a>. I won't be covering regular expressions, but they will eventually show up and be useful as part of your programmer toolkit. It's good to get familiar with them.

### Additional Resources

- [A Wealth of Ruby Loops and Iterators](http://www.skorks.com/2009/09/a-wealth-of-ruby-loops-and-iterators), Shorks
- [Control Structures](http://www.rubyist.net/~slagell/ruby/control.html), Rubyist

## Arrays and Hashes

To review, we've learned how to create functions, call upon methods, create classes, and generate basic programs in Ruby. We'll now be moving into creating arrays and hashes.

### Arrays

Ruby arrays and hashes are indexed collections that store objects. Arrays and hashes can contain different object types: strings, integers, and floating-point numbers. Arrays tend to be more efficient in accessing elements, but hashes provide greater flexibility.

Arrays are initiated between square brackets. Inside of an array you can access individual elements by calling upon its index. Note that Ruby begins its index with zero.

```ruby
my_array = ["Ambrose", "White", "Worster"]

# print the items in the array by calling
# their index
puts my_array[0] # => Ambrose
puts my_array[1] # => White
puts my_array[2] # => Worster
```

There is no practical limit as to how many things an array can hold. And, as mentioned above, there is no problem with mixing types of array elements. You could just as easily write:

```ruby
my_array = [ 42, "books", 3.14 ]
puts my_array[0] # => 42
puts my_array[1] # => books
puts my_array[2] # => 3.14
```

Note that strings must be enclosed in single or double quotes.

Arrays also include two operators. The first is <code>pop</code>, which removes the item on the right side (or, the end of the array). The other is <code>shift</code>, which removes items on the left side (beginning) of the array.

```ruby
my_array = ["Ambrose", "White", "Worster"]

array_change = puts my_array.pop
array_change2 = puts my_array.shift

puts array_change # => Worster
puts array_change2 # => Ambrose
```

We can also add things to the array by using the <code>push</code> and <code>unshift</code> methods. The <code>push</code> method adds items to the end (or right side of) the array while the <code>unshift</code> method adds things to the beginning of (or left side of) the array.

```ruby
my_array = ["Ambrose", "White", "Worster"]

array_new = my_array.push("Ulrich")
array_new = my_array.unshift("West")

puts "The array contains #{array_new.inspect}"
```

Arrays can also be created much more simply by using the shortcut <code>%w</code>, which removes the need for all those quotes and commas:

```ruby
# array-shortcut.rb

a = [ 'Apple', 'Microsoft', 'Linux', 'Solaris' ]
a[0] # => "Apple"
a[1] # => "Microsoft"

# we can achieve the same thing by using:

a = %w{ Apple Microsoft Linux Solaris }
a[0] # => "Apple"
a[1] # => "Microsoft"
```

We can create an empty array by calling <code>Array.new</code>. The array is defining what objects must look like. Remember that every class has a special method called <code>new</code>, and <code>new</code> is a special method called a <strong>constructor</strong>. By calling <code>Array.new</code>, we're asking Ruby to create an empty object. So, lets create an empty array and populate it with data:

```ruby
authors = Array.new

authors.push("Hemingway")
authors.push("Faulkner")
authors.push("Whitman")

puts authors
```

The program should print the contents of the array to the screen.

### Hashes

Ruby hashes share similarities with arrays but operate differently and have different syntaxes. Hashes use braces rather than brackets. Most importantly hashes must provide two objects for every entry, one for the <strong>key</strong> and one for the <strong>value</strong>. The key and the value are separated by a <code>=></code>.

So, lets say we wanted to map author ratings. The hash setup would look like this:

```ruby
authors = {
  'Hemingway'   =>  'five_stars',
  'Stephenson'  =>  'four_stars',
  'Heppler'    =>  'one_star',
  'Whitman'    =>  'five_stars',
  # key      =>  value
}
```

The item to the left of <code>=></code> is the <strong>key</strong> while item on the right is its corresponding <strong>value</strong>. Keys in a hash must be unique (we cannot have two "Stephenson," for example) but values can repeat. Hashes are indexed with the same square brackets as arrays. To print results from the above hash, we could write:

```ruby
puts authors['Whitman'] # => five_stars
puts authors['Stephenson'] # => four_stars
```

Also, like arrays, you can create an empty hash with <code>Hash.new</code> and inject data into it. For example:

```ruby
my_hash = Hash.new()

hash['Dickenson'] = 'three_stars'
```

Hashes have one significant advantage over arrays: they use any object as an index. And, if you're using Ruby 1.9, Ruby also remembers the order in which you add items to the hash. When you iterate over entries, Ruby will return them in the correct order. Hashes are a frequently used data structure in Ruby.

### Additional Resources

- [The Basics of Ruby Arrays](http://thinkvitamin.com/code/ruby-arrays/), Geoff Grosenbach
- [Ruby Arrays](http://carlosgabaldon.com/ruby/ruby-arrays/), Carlos Gabaldon
- [Ruby Enumerables: Hashes](http://blog.devinterface.com/2011/01/ruby-enumerables-hashes/), DevInterface
- [Memo #3: Advanced usage of Ruby hashes and arrays](http://kpumuk.info/ruby-on-rails/memo-3-advanced-usage-of-ruby-hashes-and-arrays/), Dmytro Shteflyuk
- [Ruby Hash](http://programmingbulls.com/ruby-hash), Programming Bulls

## Working With Advanced Data

In this section, a whole new world of programing is about to open before your eyes. So far, we've been working with simple data inputs through the use of .gets(), but the method only allows us to call upon a single data entry. What would be infinitely more useful would be the ability to read files outside the program. We can do this with Ruby's <code>File</code> class.

### Input/Output

When working with files, you have some options about how you want to access them. These are called <strong>mode specifiers</strong> and describes read/write characteristics of the file: <code> r+</code> (read/write text, or append data), <code>r</code> (read only), <code>w</code> (write only), and <code>w+</code> (read/write, but destructive because it destroys whatever existed in the file previously).

Imagine we have a primary source document we would like to read. You can [download this file](https://github.com/hepplerj/rubyist-historian/blob/master/04-ArraysHashes/letter.txt) from Github to your local disk for something to work with (this is a letter from a Civil War soldier). We're going to ask Ruby to read the file and print the results to the screen:

```ruby
File.open("letter.txt", "r") do |file|
  lines = file.readlines
  puts lines
end
```

We could also print out specific lines of the array:

```ruby
File.open("letter.txt", "r") do |file| # open the file and assign to variable 'file'
  
  line_array = file.readlines

  puts line_array[3]
  puts line_array[5]
  puts line_array[9]
end

# Since we used the "r" specifier, Ruby will automatically close the
# file. Otherwise, you will need to exit the file using file.close().
```

The program will print the specified lines to the screen.

We can also write to files using <code>File.new</code>:

```ruby
file = File.new("my_file.txt", "w")

file.write("Hello, world!")
file.write("\n")
file.write("I'm learning Ruby!")

file.close()
```

After running the program. it will will create the file <code>my_file</code> in the directory you are working in. The file should contain the contents we wrote.

You now know how to read and write files. A whole new world of programming should be opening before you.

### Additional Resources

- [Read/Write Files](http://www.codingfriends.com/index.php/2009/07/28/readwrite-files-3/), Coding Friends
- [Working with Files in Ruby](http://www.techotopia.com/index.php/Working_with_Files_in_Ruby), Techtopia

## Randomness

We're entering the final leg of our journey. We've covered a lot of topics in the last few sections, but I just have a couple of things to touch on before we move on to writing our first full program together.

### Constant Variables

A variable that is in all caps cannot be reassigned anywhere in the program. For example, if you were writing a program that used Pi in its calculations, you wouldn't want the program (or yourself or another programmer) to accidentally override the value of Pi. To prevent this, Ruby allows for constant variables. We would simply write this in all caps:

```ruby
PI = 3.141592
```

We can now use the variable anywhere in the program without fear that it will be overridden by another variable. For example, we could use Pi to calculate the area and circumference of a circle: 

```ruby
PI = 3.141592

puts "Enter a radius to calculate: "
radius = gets.chomp.to_f

area = PI * (radius**2)
area = "%.4f" % area
puts "The area of the circle is: #{area}"

circ = 2 * radius * PI
circ = "%.4f" % circ
puts "The circumference of the circle is: #{circ}"
```

### External Libraries

In the last section we talked about modules and the ability to avoid namespace conflicts. The other great thing about modules is there are literally thousands of modules that exist outside the Ruby system, written and (theoretically) tested by other programmers, but available for your use. You probably saw an early version of this when we first talked about modules and the use of <code>Trig.rb</code> and <code>Morals.rb</code>. <strong>Libraries</strong> operate by prefacing the call with <code>require</code> and then tell Ruby what we want included:

```ruby
require 'rubygems'
```

How do we know what's available to us as programmers? By consulting either <a href="http://rubyforge.org/">RubyForge</a> or the <a href="http://raa.ruby-lang.org/">Ruby Application Archive</a> (see <a href="http://www.ruby-lang.org/en/libraries/">Ruby-Lang.org</a> for more). To use the libraries, you'll need to have a copy on your local system. Many Ruby libraries are conveniently packaged under <a href="http://docs.rubygems.org/">Ruby Gems</a> and provides a standard formate for distributing Ruby programs and libraries. Follow the <a href="http://www.ruby-lang.org/en/libraries/">instructions on Ruby-Lang.org</a> on how to download and install Ruby Gems.

Perhaps one of the most useful libraries that Prof. Ramsay pointed our class to was the <code><a href="http://deveiate.org/projects/Linguistics/">linguistics</a></code> library:

```ruby
# linguistics.rb

require 'rubygems'
require 'linguistics'

# tell linguistics to use English
Linguistics::use( :en )

puts 185934538450.en.numwords
# => one hundred and eighty-five billion, nine hundred and thirty-four million, five hundred and thirty-eight thousand, four hundred and fifty
```

Or maybe you want to know what the plural of "goose" is:

```ruby
Linguistics::use( :en )
"goose".en.plural
# => "geese"
```

Or maybe we have an array of farm animals:

```ruby
Linguistics::use( :en )
animals = %w{dog cow ox chicken goose goat cow dog rooster llama pig goat dog cat cat dog cow goat goose goose ox alpaca}
puts "The farm has: " + animals.en.conjunction
```

This will print: 

```ruby
The farm has: four dogs, three cows, three goats, two oxen, two geese, two cats, a chicken, a rooster, a llama, a pig, and an alpaca
```

You can [do a lot](http://deveiate.org/projects/Linguistics/wiki/English) with <code>linguistics</code>.

Choose your external libraries carefully, but also don't reinvent the wheel if you can avoid it. Don't be afraid of scrapping an entire program or salvaging good code and throwing away the rest. In my experience, programming contains its headaches -- there will be failure, but there's always a learning opportunity in failure.

### Commenting
Comment your code and comment it well. We've already seen some of this in Ruby. Commenting a single line in Ruby starts with a <code>#</code>. But we can also write multi-line comments by putting our text between <code>=begin</code> and <code>=end</code>.

```ruby
# this is a single line comment

=begin
Multi-line comment

And another

Yet another
=end
```

I frequently use single line comments for explaining what chunks of code are doing, while multi-line commenting is often useful for removing parts of code without actually deleting it. This makes debugging much easier. Be sure to use your commenting wisely by explaining what the code doesn't tell you. When you define functions or classes or variables, it should be fairly clear what's going on. But commenting on why you made the choices you made that will help you or another programmer better understand the code is worth including. Remember: programming should be as much about readability as it is about its functionality. Comment even if its code only you will be seeing.

### Plan Ahead
I read somewhere recently that code is the crystallization of human thought (if I can find the comment, I'll attribute it). Plan ahead in the programs you write, make sure the intent is clear, explain how you expect the code to work. Diagram! Design mockups! Some of my best tools aren't digital: I keep a permanent marker and stack of paper handy for sketching out ideas.

### Backup!
Keep backups of multiple versions. Better yet, place your stuff under version control like Subversion or Github.

### Additional Resources
Now that you have the basics, you might want to learn more and start creating awesome stuff for the Internet. Here are some additional resources to learn more about Ruby and other languages.

#### General Resources

- [Mozilla Web Development Resources](https://developer.mozilla.org/en/Web_Development)
- [CarlHProgramming Lessons](http://www.reddit.com/r/carlhprogramming) on Reddit
- [MIT OpenCourseWare's Introduction to Computer Science and Programming](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-00-introduction-to-computer-science-and-programming-fall-2008/)


#### Ruby / Ruby on Rails

- [Agile Web Development with Rails](http://pragprog.com/titles/rails3/agile-web-development-with-rails)
- [Rails for Zombies](http://railsforzombies.org/)
- [RubyOnRails.org's screencasts](http://rubyonrails.org/screencasts)
- [The Pragmatic Guide to Programming Ruby 1.9](http://www.amazon.com/Programming-Ruby-1-9-Pragmatic-Programmers/dp/1934356085/ref=sr_1_1?ie=UTF8&qid=1296332983&sr=8-1)
- [_why's Poignant Guide to Ruby](http://mislav.uniqpath.com/poignant-guide/book/)


#### JavaScript

- [JavaScript: The Definitive Guide](http://www.amazon.com/gp/product/0596101996?ie=UTF8&tag=gmgamzn-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0596101996)
- [JavaScript, JavaScript](http://javascriptweblog.wordpress.com/) blog by Angus Croll
- [Learn Advanced Javascript](http://ejohn.org/apps/learn/)
- [jQuery](http://jquery.com/), [Dojo](http://dojotoolkit.org/), [MooTools](http://mootools.net/), and [Yui](http://developer.yahoo.com/yui/).

#### PHP

- [PHP Manual](http://us.php.net/manual/en/index.php)
- Zend offers [PHP for the Absolute Beginner](http://devzone.zend.com/article/627)


#### Mobile App Development

- [Stanford's iPhone Application Development](http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewPodcast?id=384233225)
- [Android Developer](http://developer.android.com/index.html) site

Next up, we're writing a program together. We're going to build a word frequency generator and begin working with the web.

## Our First Program

"Okay, Jason," you're asking yourself, "I'm tired of saying hello and counting numbers and doing mathematics. How can Ruby be applied to my work as a humanities scholar?" I'm thrilled you asked! Because today, we're writing our first full program together. I'll warn you, this might be a long read and a lot of writing. But I'm hoping by doing this we experience the process of designing, planning, writing code, optimizing code, debugging, and finally using the program.

We're going to write a program based off a homework example we completed in Prof. Steve Ramsay's class (To Steve's future students: don't copy this program. Your professor will know). We're going to take a word frequency generator and read a file off the Internet, strips the HTML or XML tagging out of the file, generate a word frequency, and print the frequency as a new HTML file. A lot will be happening, so I hope I can carefully and concisely explain the details of our program as we go along. 

One potential way to write our word frequency program is as such: 

```ruby
# frequency.rb

def separation(string)
  string().downcase().scan(/[\w']+/) # downcase and strip out white space
end

def word_count(elements)
  number = Hash.new(0)
  for word in elements
    number[word] += 1
  end

  number

end

text = File.read("text.txt")
elements = separation(text)
number = word_count(elements)
sorted_list = number.sort_by { |word, count| count }

most_to_fewest.each { |word, count| puts "#{count} #{word}" }
```

Our program takes in a file (<code>text</code>) and sends the file into our <code>separation</code> method to convert everything into a string, downcase the words for normalization, and scan for whitespace (hence the regex code <code>/[\w']+/</code>). Once the program read the file and converted the text into individual words, it sends the file into our <code>word_count</code> method and enters the file into a hash. Inside of <code>word_count</code>, the file counts the words and for each instance of a word adds an increment until the file has finished processing. We return number and call the <code>sort</code> method and assign sort values (<code>word</code> and <code>count</code>) and print our results.

There are certainly several ways to achieve the results we're after. If you have your own word frequency generator that you're comfortable working with, go ahead and use it. I'll be using my own code:

```ruby
# frequency.rb

filename = File.new("text.txt", "r").read().downcase().scan(/[\w']+/)
frequency = Hash.new(0)
filename.each { |word| frequency[word] += 1 }
frequency.sort_by { |x,y| y }.reverse().each { |w,f| puts "#{f}, #{w}" }
```

You should now have a working word frequency generator. However, we want to be able to read HTML files from the web; this will make the program much more useful. To do this we're going to import a Ruby library called <code>open-uri</code> and use its methods to fetch web data. Let's first look at how we achieve the ability to have Ruby read web files before we integrate it into our frequency program. I'll be using an XML newspaper file from one of my digital history projects -- feel free to use the same or select your own file:

```ruby
require 'open-uri'

uri_file = open("http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml").read()

puts uri_file
```

The above file will read the URL and print to the screen. But you'll notice something that will inconvenience us if we try and generate a frequency: the output includes the HTML tags. We need to get rid of all that junk. There are a couple of ways to do that, but we're going to return to our good friend regex to look for HTML tags and strip out everything we don't want. We'll use the <code>gsub</code> method and [regular expressions](http://etext.lib.virginia.edu/services/helpsheets/unix/regex.html) to substitute HTML tags with empty lines. We'll also use it to strip out punctuation marks and other HTML formatting (such as <code>&quot;</code>). Make a small edit to your file:

```ruby
require 'open-uri'

# read a URL, strip out HTML tags, and assign the file to a variable
uri_file = open("http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml").read().gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "\""/)

puts uri_file
```

You should now be seeing just the text of the webpage we are having Ruby read. Pretty cool, huh? But we're not quite where we want to be yet. Let's also get rid of punctuation and numbers as well as downcase all the text so we have a consistent word base:

```ruby
uri_file = open("http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml").read().gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'":.)]/, '').downcase

puts uri_file
```

Now let's add this to our frequency generator.

```ruby
require 'open-uri'

uri_file = open("http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml").read.gsub(/<\/?[^>]*>/, "").gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'":.)]/, '').downcase

filename = File.new("#{uri_file}","r").read.downcase.scan(/[\w']+/)
frequency = Hash.new(0)
filename.each { |word| frequency[word] += 1 }
frequency.sort_by { |x,y| y }.reverse.each { |w,f| puts "#{f}, #{w}" }
```

Ok, run <code>ruby frequency.rb</code> and we should . . . wait, what happened? If you run this, you should get an error. Time to debug!

The issue is we're not reading a file, we're reading the contents of a variable. So, there's no need for the <code>File.new</code> class. We can get rid of that. We also need to update the <code>each</code> method to read our URL variable:

```ruby
require 'open-uri'

uri_file = open("http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml").read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'":.)]/, '').downcase

frequency = Hash.new(0)
uri_file.each { |word| frequency[word] += 1 }
frequency.sort_by { |x,y| y }.reverse.each { |w,f| puts "#{f}, #{w}" }
```

All right, now we can run this. Type in <code>ruby frequency.rb</code> and . . . whoh. Something still isn't right. You should be outputting some sort of frequency counter, but the program is counting lines rather than individual words. We forgot to split the words apart. So, we'll add the <code>split</code> method:

```ruby
require 'open-uri'

uri_file = open("http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml").read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'":.)]/, '').downcase.split(' ')

frequency = Hash.new(0)
uri_file.each { |word| frequency[word] += 1 }
frequency.sort_by { |x,y| y }.reverse().each { |w,f| puts "#{f}, #{w}" }
```

Before we move on, let's clean things up a bit. Let's move our URL reader into a method and rewrite some code. The method should look like this:

```ruby
def readFile(url)
  
  # Strip out HTML tags, alphanumeric characters, and punctuation, lower-case 
  # all words, and split the words apart 
  uri_file = open(url).read().gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'":.)]/, '').downcase.split(' ')

  return uri_file

end
```

Now we can rewrite the URL input as:

```ruby
url = "http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml"
uri_file = readFile(url)
```

Your file should now look similar to this:

```ruby
require 'open-uri'

def readFile(url)
  
  # Strip out HTML tags, alphanumeric characters, and punctuation, lower-case 
  # all words, and split the words apart 
  uri_file = open(url).read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'""':.)]/, '').downcase.split(' ')

  return uri_file

end

# create a dictionary of n-grams

url = "http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml"
uri_file = readFile(url)

#print uri_file

frequency = Hash.new(0)
uri_file.each { |word| frequency[word] += 1 }
frequency.sort_by { |x,y| y }.reverse.each { |w,f| puts "#{f}, #{w}" }
```

We're also going to add a new method of inputting files by using Ruby's ARGV method. ARGV is a global array that allows us to pass command-line arguments after the filename. So, we'll rewrite the code above a bit:

```ruby
require 'open-uri'

def readFile(url)

  # Strip out HTML tags, alphanumeric characters, and punctuation, lower-case
  # all words, and split the words apart
  uri_file = open(url).read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'""':.)]/, '').downcase.split(' ')

  return uri_file

end

# create a dictionary of n-grams

url = ARGV[0]
uri_file = readFile(url)

#print uri_file

frequency = Hash.new(0)
uri_file.each { |word| frequency[word] += 1 }
frequency.sort_by { |x,y| y }.reverse().each { |w,f| puts "#{f}, #{w}" }
```

You should now be able to run <code>ruby frequency.rb http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml</code> in the command line. And there we have it! A working word frequency generator that can read HTML files or local files. This may be as far as you want to go, but if you're like me, you'd love to have a program that not only generates frequencies but will also output a file that you can use. In my case, when doing digital scholarship, I want files that can be read by a browser. So, we're going to have the frequency list export as HTML. For this, we'll be bringing back in our <code>File</code> I/O method:

```ruby
File.open("output.html", "w") do |output|
    frequency = Hash.new(0)
    uri_file.each { |word| frequency[word] += 1 }
    frequency.sort_by { |x,y| y }.reverse().each do |w,f| 
      output.write "<p>#{f}, #{w}</p>\n"
  end
end
```

Let's also let the user know where the file was exported. Add to the end of the file:

```ruby
puts "\nFile exported to #{Dir.pwd}.\n"
```

So, you're program should now look like:

```ruby
require 'open-uri'

def readFile(url)

  # Strip out HTML tags, alphanumeric characters, and punctuation, lower-case
  # all words, and split the words apart 
  uri_file = open(url).read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'""':.)]/, '').downcase.split(' ')

  return uri_file

end

# create a dictionary of n-grams

url = ARGV[0]
uri_file = readFile(url)

# print output to HTML file

File.open("output.html", "w") do |output|
    frequency = Hash.new(0)
    uri_file.each { |word| frequency[word] += 1 }
    frequency.sort_by { |x,y| y }.reverse().each do |w,f| 
      output.write "<p>#{f}, #{w}</p>\n"
  end
end

puts "\nFile exported to #{Dir.pwd}.\n"
```

You should now be set to write to the command line <code>ruby frequency.rb http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml</code>, which will compute the frequencies and output the results to an HTML file.

Neat, huh? Except . . . well, perhaps it isn't that useful yet. I mean, is it really useful for us to know that the word "the" shows up 35 times? Not really. In fact, you've probably noticed that the majority of the highest frequencies in the list are common words (this is known as <a href="http://en.wikipedia.org/wiki/Zipf%27s_law">Zipf's Law</a>). Let's get rid of those.

We'll start by creating an array of common words. Let's also make it a constant variable so we don't have to worry about override problems. Remember that we stripped out punctuation, so we need to maintain the words without apostrophes:

```ruby
STOPWORDS = %w{a about above across after again against all am an and any are arent as at be because been before being below between both but by cant cannot could couldnt did didnt do does doesnt doing dont down during each few for form further had hadnt has hasnt have havent having he her here heres hers herself him himself his how i id ill im ive if in into is isnt it its itself lets me more most mustnt my myself my myself no nor not of off on once only or other ought our ours ourselves out over own same shant she should shouldnt so some such than that the their theirs them themselves then there these they this those through to too under until up very was we were what when where which while who why with would you your yours yourself yourselves}
```

Now we'll add this to our <code>readFile</code> method and tell Ruby to remove words that appear in the array:

```ruby
require 'open-uri'

STOPWORDS = %w{a about above across after again against all am an and any are arent as at be because been before being below between both but by cant cannot could couldnt did didnt do does doesnt doing dont down during each few for form further had hadnt has hasnt have havent having he her here heres hers herself him himself his how i id ill im ive if in into is isnt it its itself lets me more most mustnt my myself my myself no nor not of off on once only or other ought our ours ourselves out over own same shant she should shouldnt so some such than that the their theirs them themselves then there these they this those through to too under until up very was we were what when where which while who why with would you your yours yourself yourselves}

def readFile(url)
  
  # Strip out HTML tags, alphanumeric characters, and punctuation, lower-case
  # all words, and split the words apart
  uri_file = open(url).read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'""':.)]/, '').downcase.split(' ') - STOPWORDS
  
  return uri_file

end
```

The program should now remove words that appear inside of the <code>stopwords</code> array. Now we have something a little more useful to us.

So, the program in its entirety should now look like:

```ruby
#!/usr/bin/ruby -w

# FREQr.rb
#
# Written by Jason A. Heppler
#
# This program is free software.
# You can distribute/modify this program under the terms of
# the GNU Lesser General Public License version 2.1.
# 
# Last Modified: Mon Jan 10 23:15:08 CST 2011

require 'open-uri'

STOPWORDS = %w{a about above across after again against all am an and any are arent as at be because been before being below between both but by cant cannot could couldnt did didnt do does doesnt doing dont down during each few for form further had hadnt has hasnt have havent having he her here heres hers herself him himself his how i id ill im ive if in into is isnt it its itself lets me more most mustnt my myself my myself no nor not of off on once only or other ought our ours ourselves out over own same shant she should shouldnt so some such than that the their theirs them themselves then there these they this those through to too under until up very was we were what when where which while who why with would you your yours yourself yourselves}

# Strip out HTML tags, alphanumeric characters, and punctuation, then 
# lower-case all words, split the words apart, and remove stopwords 
def readFile(url)
  
  uri_file = open(url).read.gsub(/<\/?[^>]*>/, "").gsub(/&quot;*/, "").gsub(/[0-9]*/, "").gsub(/[(,?!\'""':.)]/, '').downcase.split(' ') - STOPWORDS
  
  return uri_file

end

# Create a dictionary of n-grams
url = ARGV[0]
uri_file = readFile(url)

# Save output to HTML
File.open("output.html", "w") do |output|
    frequency = Hash.new(0)
    uri_file.each { |word| frequency[word] += 1 }
    frequency.sort_by { |x,y| y }.reverse().each do |w,f| 
      output.write "<p>#{f}, #{w}</p>\n"
  end
end

# Give the user an exported-to message
puts "\nFile exported to #{Dir.pwd}.\n"
```

Simply type in <code>ruby frequency.rb http://www.framingredpower.org/archive/newspapers/frp.wapo.19721102.xml</code> and the program will output an HTML file and confirm the successful completion of the program. Congrats! You now have your first full Ruby program. Do some hacking on this program. Add a function or feature to it or optimize the code and see what you can accomplish. Perhaps, for example, you want another method so you can output an HTML file that generates keywords in context or a word cloud. Or, if you're really ambitious, maybe you can learn about [Ruby on Rails](http://rubyonrails.org/) and make this program run as a webpage rather than the command line.

If you've stuck through reading <em>The Rubyist Historian</em> to the end, you should now have a working knowledge of the Ruby programming language. I hope that I've been able to competently explain key concepts and ideas of Ruby. But we've only touched the surface of Ruby. There are several resources out there to continue learning about Ruby. I would start with these:


- [Why's (Poignant) Guide to Ruby](http://mislav.uniqpath.com/poignant-guide/)
- [Ruby User's Guide](http://www.rubyist.net/~slagell/ruby/)
- [The Little Book of Ruby](http://www.sapphiresteel.com/The-Little-Book-Of-Ruby)


In [about ten years](http://norvig.com/21-days.html) you can call yourself a programmer.

*Visit the Rubyist Historian [Table of Contents](http://www.jasonheppler.org/the-rubyist-historian-the-series.html) for more sections, and check out the [Github repository](https://github.com/hepplerj/rubyist-historian) for an archive of all the code examples.*

*See something that's wrong? Examples that don't work? Explanations that are unclear or confusing? Embarrassing typographic errors? Drop me an email at jason.heppler+feedback at gmail and I'll fix things right up!*

*Topic structure, examples, and explanations for the Rubyist Historian are inspired by, credited to, and drawn from Stephen Ramsay and his course Electronic Text.*
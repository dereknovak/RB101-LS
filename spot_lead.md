# RB109 Spot Lead

## Navigation

- [Variables as Pointers](#variables-as-pointers)
- [Variable Shadowing](#variable-shadowing)
- [Variable Scope](#variable-scope)
- [Constants](#scope-of-constants)
- [Pass-by-Reference](#pass-by-reference)
- [Pass-by-Value](#pass-by-value)
- [Short-Circuit](#short-circuit)
- [Truthiness](#truthiness)
- [Default Parameters](#default-parameter)
- [Explicit Returns](#explicit-return)
- [Reading Code](#reading-code)


```ruby
=begin

RB109 SPOT Session

INTRODUCTIONS
- What is your name?
- Where are you at in the world?
- Where are you in the course?
- What would you like to cover today?

DISCLAIMER
- I am not a TA, so I can only speak from my own experience preparing/taking the exams
- I cannot disclose specific assessment questions

STUDY GUIDE
- Variables
  - Variables as pointers
  - Variable shadowing
  - Local variable scope in relation to method definitions
  - Local variable scope in relation to blocks, including nested blocks and peer blocks
  - Scope of constants
  - Mutating values vs. reassigning variables
- Methods:
  - Method definition vs. method invocation
  - Passing and using blocks with methods
  - Parameters vs. arguments
  - Default parameters
  - Implicit vs. explicit return values
  - Mutating vs. non-mutating methods
  - Using method return values as arguments to other methods
- Mutable vs. immutable data types
- Output vs. return
- Pass-by-reference vs. pass-by-value
- Truthiness

=end
```

# Variables as Pointers

```ruby
# How many 'pointers' are referencing the 'Hello World!' string object assigned to 'a'?

a = 'Hello World!'
b = a
c = 'Hello World!'

array = [a, 'Hello World!']
hash = {1 => a, b: 'Hello World!'}
```

```ruby
a = 'hello'
b = a
c = 'hello'

p a == b
p a == c

p a.object_id == b.object_id
p a.object_id == c.object_id
```

# Variable Shadowing

```Ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
```

```Ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```

# Pass-by-Reference

```Ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)

s
t
```

```Ruby
def fix(value)
  value[1] = 'x'
  value
end

s = 'abc'
t = fix(s)

s
t
```

```Ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

# Pass-by-Value

```Ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

# Short-Circuit

```ruby
5 || puts('Hello World!')
```

```ruby
puts('Will this output?') && puts('What about this?')
```

# Variable Scope

```Ruby
a = 1
5.times do
  b = 2
end

loop do
  puts a
  puts b
end
```

```Ruby
def plus(x, y)
  x = x + y
end

plus(1, 2)
puts x
```

```Ruby
def change_name(name)
  name = 'bob'
end

name = 'jim'
change_name(name)
puts name
```

```ruby
str = ’cat’

def say
  str = ’meow’
end

puts str
```

# Truthiness

```Ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsy"
end
```

```ruby
animal = 'dog'

if animal = 'cat'
  puts 'Meow'
else
  puts 'Woof!'
end
```

```Ruby
def meaning_of_life(num)
  if num = 42
    puts "It's 42!"
  else
    puts "It's not 42!"
  end
end

meaning_of_life(42)
```

# Scope of Constants

```ruby
WHEELS = 4

puts WHEELS

2.times do
  puts WHEELS # ?
end

def car_wheels
  WHEELS
end

car_wheels # ?

def car_wheels2
  wheels = 2

  loop do
    puts WHEELS
    break
  end
end

car_wheels2 # ?
```
# Explicit Return

```ruby
def number_selection
  1
  2
  3
  4
  5
end

p (number_selection == 2)  # true
```

```ruby
def greet(greeting)
  return ‘Hello’
  greeting
end

str = ‘Goodbye’
puts greet(str)
```

# Default Parameter

```ruby
def echo(sound = 'Hello')
  puts sound.upcase
  puts sound.capitalize
  puts sound.downcase  
end

echo('Echo')
echo
```

```ruby
# What is output and why? What are 2 fixes that can be made?
def juggle(balls)
  puts "I'm juggling #{balls} balls!"
end

juggle  # I'm juggling 3 balls!
```

# Reading Code

## Easy

```ruby
animal = 'dog'

case animal
when 'cat'
  puts 'Meow'
when 'dog'
  puts 'Woof'
else
  puts 'Silence...'
end
```

```ruby
number = 5
number > 6 ? "Greater than 6!" : "Less than 6..."
```

## Medium

```Ruby
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end
```

## Hard

```Ruby
def say
  puts 'Hello!'
end

greeting = say
word = ''

if greeting
  word = 'Hello again!'
elsif greeting == false
  word = 'Stay quiet'
else
  word = greeting
end

puts word
```

```ruby
def countdown(starting_num)
  loop do
    puts starting_num
    starting_num -= 1
    break if starting_num == 0
  end
  
  puts ‘Blast off!’
end

countdown(3)
```

```ruby
def add(num1, num2)
  num1 + num2
end

def multiply(num1, num2)
  num1 * num2
end

multiply(add(2, 5), 3)
```


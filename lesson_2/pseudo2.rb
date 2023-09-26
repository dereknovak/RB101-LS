=begin

Given an array of strings.

Define a method 'join' that takes 1 argument, an array of strings
Set a new local variable 'full_string' 
Iterate on the array, returning each string to the new string

Return the new string

...

START

Given an array of strings

DEFINE new method, 'join'

SET a new local variable 'full_string'

ITERATE using 'each' block
  Push each array value into full_string

RETURN full_string

END

=end

def join(arr)
  full_string = String.new

  arr.each { |str| full_string << str }
  
  full_string
end

puts join(['blue', 'orange', 'green', 'yellow'])

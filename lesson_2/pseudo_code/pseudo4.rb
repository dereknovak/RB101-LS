=begin

Given a string.

-Define a method that takes 2 arguments, a string and a given character
-Create a new local variable, a counter, that counts down from 3
-Create a new local variable, a string, that will contain characters from inputted string.
-Iterate on the parameter string, character by character
  -Push characters to new string, one at a time
  -Check if the character matches the given parameter character
    -If it does, subtract from counter
    -If counter is 0, break out of loop
-Return the last index value of string if counter is 0
-Return nil if count never reaches 0

...

START

Given a string

DEFINE method 'third_occurance' (string, given character)

SET counter = 3
SET new string 

ITERATE string using each

  IF given character = element
    new string << element
    IF given char matches element
      counter = counter - 1
      break loop if counter is 0
RETURN last index of new string if counter == 0
RETURN nil if the counter > 0

END

=end

def third_occurance(string, given_char)
  counter = 3
  new_string = String.new

  string.each_char do |char|
    new_string << given_char
    counter -= 1 if char == given_char 
    break if counter == 0
  end
  
  counter == 0 ? new_string.rindex(given_char) : nil
end

puts third_occurance('axbxcdxex', 'x')
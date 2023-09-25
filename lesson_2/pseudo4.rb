=begin

Given a string.

-Define a method that takes 2 arguments, a string and a given character
-Create a new local variable, a counter, that counts down from 3
-Iterate on the parameter string, character by character
  -Check if the character matches the given parameter character
    -If it does, subtract from counter
    -If counter is 0, return the character's index value
-Return nil if count never reaches 0

...

START

Given a string

DEFINE method 'third_occurance' (string, given character)

SET counter = 3

ITERATE string using each
  IF given character = element
    counter = counter - 1
    IF counter == 0
      RETURN element's index
RETURN nil if the counter > 0

END

=end

def third_occurance(string, given_char)
  counter = 3
  new_string = String.new

  string.each_char do |char|
    new_string << given_char
    if char == given_char
      counter -= 1
      break if counter == 0
    end
  end
  counter == 0 ? new_string.rindex(given_char) : nil
end

puts third_occurance('axbxcdaxexa', 'a')
# The error is invoked because a string and an integer cannot be concatenated.
# This can be fixed using String Interpolation.
# You can also call the `#to_s` method on (40 + 2), making both values strings
# and therefore allowing concatenation.

puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s
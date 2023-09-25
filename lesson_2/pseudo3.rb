=begin

Given an array of integers

-Define a method that takes an array of integers as an argument
-Create a local variable and set to a new array
-Iterate on the provided array
  -Push the odd index values to the new array

Return the new array

...

START 

Given an array of integers

DEFINE a method 'every_other', that takes 1 argument, an array

SET odd_values = a new array

ITERATE on the parameter array
  IF integer's index value is even
    odd_values << integer

RESTURE odd_values

END

=end

def every_other(arr)
  odd_values = Array.new
  arr.select do |i| 
    if arr.index(i).even?
      odd_values << i
    end
  end
  odd_values
end

p every_other([1, 4, 7, 2, 5])
=begin

Given two arrays
Assumes both arrays have same number of elements

-Define a method that takes 2 arguments as its paramater, 2 arrays
-Create a counter, starting at 1, to help keep track of index values
-Iterate the second array into the first array, using an insertion method
  -Push the integer to the first array in index 1
  -Add 2 to the counter
-Return the transformed first array

...

START

Given 2 arrays

DEFINE method 'merge' (array 1, array 2)

SET counter = 1
ITERATE array 2
  insert element into index 1, 3, 5... of array 1
  counter = counter + 2

RETURN array 1

END

=end

def merge(arr1, arr2)
  counter = 1

  arr2.each do |i|
    arr1.insert(counter, i)
    counter += 2
  end
  
  arr1
end

p merge([1, 2, 3], [4, 5, 6])
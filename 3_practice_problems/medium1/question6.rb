answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

=begin

On line 1, local variable `answer` is assigned to the integer 42.

On line 3, method call `#mess_with_it` is defined with one parameter, 
method local variable `some_number`. On line 4, method local variable some_number
is reassigned to the sum of itself and the integer 8 and is returned from the
method invocation.

On line 7, local variable `new_answer` is initialized and assigned to the
returned value of `#mess_with_it` being called on `answer` as an argument,
which is the integer 50.

On line 9, the `#p` method is called on `answer` minus integer 8, which will
output integer 34. This example showcases how reassignment within a method
does not influence the original local variable.

=end

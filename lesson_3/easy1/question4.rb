# Example 1

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)

# The `#delete_at` method call mutates the caller by deleting the element at the
# specified index. In the example, the method is called on the local variable
# 'numbers', an array containing the integers '1', '2', '3', '4', and '5', with
# index 1 being passed as an argument. Therefore, '2' will be deleted from the 
# array.

p numbers

# Example 2

numbers = [1, 2, 3, 4, 5]

numbers.delete(1)

# The `#delete` method call mutates the caller by deleting the element specified
# in the argument. In the example, the method is called on the local variable
# `numbers`, and array containing the integers '1', '2', '3', '4', and '5', with
# '1' begin passed an an argument. Therefore, '1' will be deleted from the array.

p numbers
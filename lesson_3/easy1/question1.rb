numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

=begin

On line 1, local variable `numbers` is initialized, referencing
an array containing the integers 1, 2, 2, and 3. On line 2, the
`#uniq` method is called on local variable `numbers`, which non-
destructively removes repeated integers in the array.

The `#puts` method is called on line 4, with local variable
`numbers` passed as an argument, which prints the strings
1, 2, 2, and 3 on separate lines. This example showcases how non-
mutating methods, such as the method call `#uniq` do not mutate or
reassign the objects referenced by the local variables they are
called upon.

=end
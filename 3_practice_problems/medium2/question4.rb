def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin

1. My string looks like this now: pumpkinsrutabaga

- Within `#tricky_method_two`, the `<<` operator mutates the caller, which
concatenates 'rutabaga' with method local variable `a_string_param`. Both
`a_string_parm` and `my_string` point to the same object, which means that
`pumpkinsrutabaga` will print during string interpolation.

2. My array looks like this now: ["pumpkins"]

- Within `#tricky_method_two`, reassignment without using `#[]=` does not
mutate the caller. `an_array_param` and `my_array` are now pointing to 2
separate objects, which means that ['pumpkins'] will print during string
interpolation.

=end
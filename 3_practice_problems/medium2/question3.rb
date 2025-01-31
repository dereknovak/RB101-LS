def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"

=begin

1. String_arg_one looks like this now: pumpkins

- Reassignment within a method does not change the assignment of the local
variable it's called upon. This initializes a new method local variable,
`string_param_one`, which is separate from `string_arg_one` outside of the method's
scope. Therefore, when `string_arg_one` is called during string interpolation,
the object it references remains as 'pumpkins'

2. String_arg_two looks like this now: pumpkinsrutabaga

- Concatenation using `<<` mutates the caller, even from within a method.
Therefore, when `string_arg_two` is called during string interpolation, the
object it references is the same, however it has been mutated to
'pumpkinsrutabaga'

=end


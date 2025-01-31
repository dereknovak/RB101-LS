greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting # => "hi there"
puts greetings # => { :a => "hi there" }

=begin

On line 2, the key-value pair of key `:a` in the hash referenced by local variable
`greetings` is assigned to the local variable `informal_greeting`. On line 3, the
string ' there' is destructively concatenated onto the value of `:a`, the string
'hi', which returns 'hi there'. This is an example of 'Variables as pointers', as
`informal_greeting` and `:a` point to the same object in memory. Therefore,
`informal_greeting` will output "hi there" and `greetings` will output
{ :a => "hi there" }. Note that `greeting` outputs the entire hash since there
was no specificity whether the key or value should be printed.
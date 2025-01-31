def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)

=begin

On line 1, method call `#foo` is defined with 1 parameter, `param`, and a default
parameter of the string "no". The method returns the string "yes"

On line 5, method call `#bar` is defined with 1 parameter, `param`, and a default
parameter of the string "no". The method uses a ternary operator, returning "yes"
if method local variable `param` is equal to "no" and "no" if it is not.

Using the call stack, here is the sequence:
1. `#bar` is called on `#foo, which has no arguments
2. Because `#foo` has no arguments, the default parameter "no" is passed. However,
method call returns the string "yes" regardless
3. `#bar` now has the argument "yes", which is not equal to "no" and therefore
returns "no".

=end

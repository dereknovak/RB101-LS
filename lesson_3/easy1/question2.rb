=begin

1. What is `!=` and where should you use it?

The 'not-equal' operator compares 2 literals, considering the comparison 'truthy'
if the literals are not equal to each other.

2. Put `!` before something, like !user_name

The 'not' operator returns false on a 'truthy' value, with the exceptions being
the objects 'false' and 'nil', which are considered 'falsy'.

3. Put `!` after something, like `words.uniq!

Using `!` is a syntax technique that method call creators may employ to communicate
that a method is mutating. However, this is inconsistent and should not be used 
unless a method within Ruby Docs or your program explicitly calls for it.

4. Put `?` before something

The `?` operator is only used in ternary operators, which follows a comparitor
and precedes the 'truthy' and 'falsy' return statements.`

5. Put `?` after something

Using `?` is a syntax technique that method call creators may employ to communicate
that a method compares the argument with what the method call's name is referencing.
However, this is inconsistent and should not be used unless a method within Ruby
Docs or your program explicityly calls for it.

6. Put `!!` before something, like `!!user_name`

The `not not` operator returns 'true' on a 'truthy' value, with the exception
begin the objects `false` and `nil`, which are considered 'falsy'.

=end
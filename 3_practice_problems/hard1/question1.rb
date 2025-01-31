if false
  greeting = 'hello world'
end

p greeting

# Typically, when you reference an uninitialized variable, Ruby will raise an
# error, stating that it's undefined. However, if that local variable is initialized
# within an `if` clause, even if it does not get executed, the local variable is
# initialized to `nil`.
advice = "Few things in life are as important as house training your pet dinosaur"

p advice.slice!(0..38)
p advice

# The method call `#slice` is not-destructive, therefore it would return the same
# value on line 3, but local variable `advice` would not be mutated otherwise.
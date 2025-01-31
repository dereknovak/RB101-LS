def color_valid(color)
  color == 'blue' || color == 'green'
end

puts color_valid('blue')
puts color_valid('green')
puts color_valid('orange')

# Ruby automatically returns the boolean object 'true' if a condition is met and
# 'false' if it is not. Therefore, the 'if..else' statement is not needed.
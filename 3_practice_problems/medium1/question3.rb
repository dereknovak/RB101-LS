def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

input = gets.chomp.to_i
puts factors(input)

# Bonus 1: The operation `number % divisor == 0` checks if there is a remainder
# after dividing the original number by the divisor. If there is no remainder,
# is considered a factor of the orignal number.

# Bonus 2: Line 8 provides the referenced value of local variable `factors`, the 
# factors of the original number, which will be returned from the method invocation.
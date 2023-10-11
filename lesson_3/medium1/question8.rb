def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

=begin

Line 11 will print 'paper' to the screen. When looking at the argument of method
call `#rps`, the intermost arguments are ("rock", "paper") and ("rock", \
"scissors"), which will return "paper" and "rock" respectively. The next layer
uses these 2 values as its argument, so "paper" will be returned. Lastly, the
outermost argument will use this value and "rock", which will return "paper".

The method call `#puts` is invoked on the returned value "paper", which prints
it to the screen.

=end
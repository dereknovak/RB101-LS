def adding_factors(target, factors)
  multiples = Array.new
  factors = [3, 5] if factors.empty?

  factors.each do |factor|
    current_multiple = factor

    while current_multiple < target
      multiples << current_multiple
      current_multiple += factor
    end
  end

  puts multiples.sort.uniq.sum
end

adding_factors(20, [])
adding_factors(20, [3, 5])
adding_factors(20, [3])
adding_factors(20, [5])
adding_factors(20, [19])
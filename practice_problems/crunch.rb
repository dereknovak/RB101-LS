def crunch(str)
  result = String.new

  str.each_char { |char| result << char unless char == result[-1] }

  puts result
end

crunch('aabbccddeeff')
crunch('abc')
crunch('aabbcc aabbcc')
crunch('a')
crunch('')
crunch('mississippi')
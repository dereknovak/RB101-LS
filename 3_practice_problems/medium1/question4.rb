def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

=begin

In the first method call `#rolling_buffer1`, the local variable `buffer` is
mutated with each `new_element` being concatenated to it.

In the second method call `#rolling_buffer2`, the local variable `input_array`
is reassigned to local variable `buffer` each time `new_element` is concatenated
with it. Therefore, the original object referenced by `input_array` is unchanged.

=end
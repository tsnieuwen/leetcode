def fibonacci(max_value)
  sequence = [1, 2]
  until sequence[-1] >= max_value
    sequence << sequence[-1] + sequence [-2]
  end
  if sequence[-1] > max_value
    sequence.delete_at(-1)
  end
  sequence.sum
end

puts fibonacci(69)

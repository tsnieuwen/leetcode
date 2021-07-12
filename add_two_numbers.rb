def add_two_numbers(l1, l2)
  x = l1.reverse.join.to_i
  y = l2.reverse.join.to_i
  new_number = x + y
  new_number.digits.reverse
end

puts add_two_numbers([2, 3, 4], [4, 7, 9])

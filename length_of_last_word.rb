def length_of_last_word(string)
  x = string.split(" ")
  if x.empty?
    0
  else
    x.last.length
  end
end

puts length_of_last_word("Hello World")

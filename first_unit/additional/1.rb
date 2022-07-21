def reverse_int(int_number)
  if int_number >= 0
    int_number.to_s.reverse.to_i
  else
    int_number.to_s.reverse.to_i * (-1)
  end

end

puts reverse_int(234)
puts reverse_int(-123)
puts reverse_int(120)

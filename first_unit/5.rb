def pow(number, power)
  multiplier ||= number
  (power - 1).times do
    number *= multiplier;
  end
  number
end
puts "Enter your number and power to get result:"
puts pow(gets.to_i, gets.to_i)
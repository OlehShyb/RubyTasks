module MyNumber
  def reverse_int(int_number)
    if int_number.class == Integer
      if int_number >= 0
        int_number.to_s.reverse.to_i
      else
        int_number.to_s.reverse.to_i * (-1)
      end
    end
  end
end

class Number
  include MyNumber
  # attr_accessor :number
end

number = Number.new
puts number.reverse_int(31)
puts number.reverse_int(-123)
puts number.reverse_int(8900)
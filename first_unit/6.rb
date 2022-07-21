def simple_numbers(edge)
  number = 0
  simple_numbers = [1]
  while number < edge
    is_simple = true
    divider = 2
    number+=1
    next if number <= divider
    while divider < number
      if number % divider == 0
        is_simple = false
        break
      end
      divider+=1
    end
    simple_numbers.push(number) if is_simple
  end
  simple_numbers
end
print simple_numbers(100)
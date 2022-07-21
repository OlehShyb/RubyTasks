def diamond(width, symbol)
  width += 1 if width.odd?
  height = 1
  tmp_width = width

  while tmp_width != 2
    tmp_width -= 2 # рахуємо висоту ромба
    height += 2
  end

  strings = Array.new
  str_nums = ((height-1)/2) # кількість рядків в половині ромба (без головного)

  str_nums.times do
    strings.push("") # заповняєм масив порожніми строками
  end

  for i in 1..str_nums do
    ((width-i*2)/2).times do
      strings[i-1] += " " # додаємо пробіли в кожен рядок
    end

    (i*2).times do
      strings[i-1] += symbol # додаємо символи в кожен рядок
    end
  end
  puts strings
  width.times do
    print symbol
  end
  puts
  puts strings.reverse
end

diamond(10, "#")
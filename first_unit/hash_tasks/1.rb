def max_in_hash(hash, n)
  max_values = hash.values # записуєм значення в масив
  max_values.max(n){ |a, b| a<=>b} # знаходимо n найбільших значень
end

my_dict = {'a':500, 'b':5874, 'c': 560,'d':400, 'e':5874, 'f': 20}
puts max_in_hash(my_dict, 3)

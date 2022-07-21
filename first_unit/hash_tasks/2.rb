def sumSalaries(salaries)
  return 0 if salaries.empty?
  sum = 0
  salaries_values = salaries.values
  for i in 0..(salaries_values.length-1) do
    sum += salaries_values[i]
  end
  sum
end

salaries = { "John": 100, "Pete": 300, "Mary": 250 }
print sumSalaries(salaries)

def max_in_array(array, n) # n - кількість максимальних елементів в масиві
  array.max(n){ |a, b| a<=>b}
end
arr = [1,20,3,9,6,4]
print "2 maximum numbers in array: "
print arr
print " is: "
print max_in_array(arr, 2)
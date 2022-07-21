def list_duplicates(array)
  duplicates = array.select { |e| array.count(e) > 1 }
  duplicates.uniq
end
def delete_duplicates(array)
  list_duplicates(array).each do |e|
    array.delete(e)
  end
  array
end

array = [1, 2, 2, 3, 3, 4, 5, 5, 7]
print array
delete_duplicates(array)
print array


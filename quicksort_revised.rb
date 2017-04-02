$total_comparisons = 0
file = 'quicksort_sample.txt'
array = []
File.readlines(file).each do |line|
  array << line.to_i
end
end
def quicksort(array, start=0, finish=array.size-1)
  return if start >= finish
  $total_comparisons += (finish - start) unless start == 0 && finish == 99999
  pivot_index = start
  pivot_value = array[pivot_index]
  i = pivot_index + 1     # this sets apart the less than and greater than
  j = i                   # this sets apart the section that has/hasn't been evaluated
  
  # evaluate the pivot to the range of elements
  while j <= finish
    
    # if pivot > element being evaluated, put the evaluted elements inside "less than" section
    if array[pivot_index] > array[j]
      array[i], array[j] = array[j], array[i]
      i += 1
    end
    j += 1
  end
  
  # swap the pivot with the right-most element in the "less than" section
  array[pivot_index], array[i-1] = array[i-1], array[pivot_index]
  new_pivot_index = array.index(pivot_value)
  
  # sort to the right of the pivot
  quicksort(array, new_pivot_index + 1, finish)
  
  # sort to the left of the pivot
  quicksort(array, start, new_pivot_index - 1)
  return array
end

quicksort(array)
p $total_comparisons
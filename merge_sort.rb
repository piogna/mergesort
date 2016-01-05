require 'pry-byebug'

def merge_sort(arr)
  return arr if arr.length <= 1
  split_index = arr.length / 2

  left = merge_sort arr[0...split_index]
  right = merge_sort arr[split_index..-1]

  merge left, right
end

def merge(left, right)
  result = []
  while (left.length > 0 && right.length > 0)
    if(left[0] > right[0])
      result << right.shift
    else
      result << left.shift
    end
  end

  while left.length > 0
    result << left.shift
  end

  while right.length > 0
    result << right.shift
  end

  return result
end

arr = []
10.times do
  arr << rand(10000)
end
puts "Before sort"
p arr

arr = merge_sort(arr)
puts "After sort"
p arr

#Question - https://www.interviewcake.com/question/ruby/find-duplicate-optimize-for-space?course=fc1&section=sorting-searching-logarithms

#Input - array of integers : range 1..n ;  array has a length of n+1 
#Output - integer that appears more than once.
#exampe - [3, 4, 6, 5, 4, 4, 2] -> 4

# Given that array is of range 1..n and of n+1 length. Atleast one is repeated - so number of unique integers is (n-1 + 1) = n 
# E.g [3, 4, 6, 5, 4, 4, 2] -> length is 7 so range has to be 1..6 ; no of possible unique integers is (6-1 +1 = 6)
# The number of elements is always one greater than the number of unique possiblities.. 
# If we cut this in half - the condition should still hold true - so atleast one of those halves should have one more element that the number of unique possibiblities. 
# If the half you have chosen, does not have more elements than the number of unqie possibilities, drop that half.
# If the half you have chosen, meets the condition, then cut it into two again.
# Repeat cutting in halves until you are left with just one item.
  

def space_edition(input_array)
  lowest_range = 1
  highest_range = input_array.length - 1
  
  while (lowest_range < highest_range)
    
    mid = (lowest_range + highest_range) /2
    
    first_half_lowest_range = lowest_range
    first_half_highest_range = mid
    
    second_half_lowest_range = mid + 1
    second_half_highest_range = highest_range
    
    number_of_elements_in_first_half = 0
    input_array.each do |number|
      if number >= first_half_lowest_range && number <= first_half_highest_range 
        number_of_elements_in_first_half += 1
      end
      
      number_of_unique_possibilities_in_first_half = first_half_highest_range - first_half_lowest_range + 1
      
      if number_of_elements_in_first_half > number_of_unique_possibilities_in_first_half
        lowest_range, highest_range = first_half_lowest_range, first_half_highest_range
      else
        lowest_range, highest_range = second_half_lowest_range, second_half_highest_range
      end
    end
    
  end

  return lowest_range
end

def test
  one = space_edition([1, 4, 6, 6, 4, 4, 2])
  two = space_edition([4, 4, 4, 6, 1, 6, 2])
  puts "\nOne: Input: [1, 4, 6, 6, 4, 4, 2] -> Output: #{one}"
  puts "\nTwo: Input: [1, 4, 4, 6, 4, 4, 2] -> Output: #{two}"
end

test

#Question - https://www.interviewcake.com/question/ruby/highest-product-of-3?section=greedy&course=fc1
#Input: array_of_ints = [10, 7, 5, 8, 11, 9]
#Output: int 10*11*9 = 990
#Examples: [10, 7, 5, 8, 11, 9] -> 990 ; [10, 7, 100] -> 7000 ; [-10, 7, 100] -> -7000; [-10, 7, 100, 1] -> 700; 
#Logic:  
# - Get three highest inputs - multiply
# - I coult sort and choose highest 3 - but sort if worse than O[n] - so .. Trying something else.
# - Go thru each int one by one. - o[n] 
# - See if the current int is greater than previous max_1 : then with max_2: then with max_3
# - Replace or leave the same accordingly.
# - Return product. 
# - O[1] space as storing fixed.
# - O[n] space

#Better
#Sort array O[nlogn]
#Go thru each element
#Count no of negatives (and)
#Store abs value of each element. 
#if odd no of negatives - product is last 3 of sorted array. 
#if even no of negatives - and prdocut of last 3.
#O[nlogn]
#O[n]


#better
#store the product of 3.
#iterate thru loop and store 


def get_product_of_3(array_of_ints)
  return 0 if array_of_ints.length < 3
  
  highest_number, lowest_number = [array_of_ints[0], array_of_ints[1]].max, [array_of_ints[0], array_of_ints[1]].min
  product_of_highest_two = highest_number * lowest_number
  product_of_lowest_two = highest_number * lowest_number
  max_prod = product_of_highest_two * array_of_ints[2]
  
  array_of_ints[2...array_of_ints.length].each do |value|
    puts "\nhighest_number:#{highest_number}, lowest_number:#{lowest_number}, max_prod:#{max_prod}, value: #{value}"
  
    new_max_product = [(product_of_highest_two * value), (product_of_lowest_two * value)].max
    puts "new_max_product#{new_max_product}"
    max_prod = [max_prod, new_max_product].max
    puts "max_prod: #{max_prod}"
    
    product_of_highest_two = [(highest_number * value), (lowest_number * value), product_of_highest_two].max
    puts "product_of_highest_two: #{product_of_highest_two}"
    product_of_lowest_two = [(highest_number * value), (lowest_number * value), product_of_highest_two].min
    puts "product_of_lowest_two: #{product_of_lowest_two}"
    
    highest_number = [highest_number, value].max
    puts "highest_number: #{highest_number}"
    lowest_number = [lowest_number, value].min
    puts "lowest_number: #{lowest_number}"
  end
  max_prod
end


 
def test
  one = get_product_of_3([10, 7, 5, 8, 11, 9])
  two = get_product_of_3([10, 7, 100])
  three = get_product_of_3([-10, 7, 100])
  four = get_product_of_3([-10, 7, 100, 1])
  five = get_product_of_3([1, 3, 2, -5, -4])
  six = get_product_of_3([-5, -4, 1, 3, 2])
  puts "\nOne: Input: [10, 7, 5, 8, 11, 9] -> Output: #{one}"
  puts "\nTwo: Input: [10, 7, 100] -> Output: #{two}"
  puts "\nThree: Input: [-10, 7, 100] -> Output: #{three}"
  puts "\nFour: Input: [-10, 7, 100, 1] -> Output: #{four}"
  puts "\nFive: Input: [1, 3, 2, -5, -4] -> Output: #{five}"
  puts "\nSix: Input: [-5, -4, 1, 3, 2] -> Output: #{six}"
end

test


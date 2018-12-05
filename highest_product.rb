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



def get_product_of_3(array_of_ints)
  return 0 if array_of_ints.length < 2
  
  max_1 = array_of_ints[0]
  max_2 = array_of_ints[1]
  max_3 = array_of_ints[2]
  array_of_ints[3...array_of_ints.length].each do |each_int|
    max_1, min_of_max_1 = [max_1, each_int].max, [max_1, each_int].min
    puts "max1 = #{max_1} :  leftover = #{min_of_max_1}"
    
    max_2, min_of_max_2 = [max_2, min_of_max_1].max, [max_2, min_of_max_1].min
    puts "max2 = #{max_2} :  leftover = #{min_of_max_2}"
    
    max_3 = [max_3, min_of_max_2].max
    puts "max2 = #{max_3}"
  end
  max_1 * max_2 * max_3
end


 
def test
  one = get_product_of_3([10, 7, 5, 8, 11, 9])
  two = get_product_of_3([10, 7, 100])
  three = get_product_of_3([-10, 7, 100])
  four = get_product_of_3([-10, 7, 100, 1])
  
  puts "\nOne: Input: [10, 7, 5, 8, 11, 9] -> Output: #{one}"
  puts "\nTwo: Input: [10, 7, 100] -> Output: #{two}"
  puts "\nThree: Input: [-10, 7, 100] -> Output: #{three}"
  puts "\nFour: Input: [-10, 7, 100, 1] -> Output: #{four}"
  
end

test
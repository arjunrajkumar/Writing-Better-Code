#Question: https://www.interviewcake.com/question/ruby/product-of-other-numbers?section=greedy&course=fc1
#Input -   [1, 7, 3, 4]
#Output - [84, 12, 28, 21] by calculating [7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]
#Logic.
#[multiply_left * multply_right]

#Input = [1,7,3,4,2,8]
#Output = [7*3*4*2*8, 1*3*4*2*8, 1*7*4*2*8, 1*7*3*2*8, 1*7*3*4*8, 1*7*3*4*2]

#Answer         =        7*3*4*2*8   ->   1*3*4*2*8   ->   1*7*4*2*8   ->   1*7*3*2*8   ->   1*7*3*4*8   ->   1*7*3*4*2
#value          =            1                7                3                4                2                8
#multiply_left  =            -                1               1*7             1*7*3           1*7*3*4         1*7*3*4*2
#multiply_right =        7*3*4*2*8         3*4*2*8           4*2*8             2*8               8                -

#Go thru once from left to right and store all the multipliers. 
#Go thru once from right to left and store all the multipliers. 


def product(input_array)
  answer = []
  product = 1
  
  input_array.each.with_index do |input, index|
    answer[index] = 1 if index == 0
    answer[index] = product if index > 0
    product *= input
  end
  
  product = 1
  (input_array.length-1).downto(0) do |index|
    answer[index] = answer[index] * product if index != input_array.length-1
    product *= input_array[index]
  end
  
  answer
end

def test
  one = product([1, 7, 3, 4])
  two = product([10, 7, 100])
  three = product([1, 2, 6, 5, 9])
  puts "\nOne: Input: [1, 7, 3, 4] -> Output: #{one}"
  puts "\nTwo: Input: [10, 7, 100] -> Output: #{two}"
  puts "\nThree: Input: [1, 2, 6, 5, 9] -> Output: #{three}"
  
end

test
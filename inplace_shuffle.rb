#Question: https://www.interviewcake.com/question/ruby/shuffle?course=fc1&section=greedy

#Input array = eg.[4,5,3,6,1,2]
#Output = [6,4,3,1,5,2]

# Go thru the entire array 
# Initially with index 0, pick a random number between (0...array.size) and interchange them.
# Then with index 1, pick a random number between (1...array.size) and interchange them.
# Then with index 2, pick a random number between (2...array.size) and interchange them.
# Repeat...

def inplace_shuffle(shuffle_me)
  shuffle_me.each.with_index do |val, index|
    random = rand(index..(shuffle_me.length-1))
    shuffle_me[index], shuffle_me[random] = shuffle_me[random], shuffle_me[index]
  end
end


def test
  one = inplace_shuffle([1, 2, 3, 4, 5, 6])
  two = inplace_shuffle([10, 7, 100])
  puts "\nOne: Input: [10, 7, 5, 8, 11, 9] -> Output: #{one}"
  puts "\nTwo: Input: [10, 7, 100] -> Output: #{two}"
end

test
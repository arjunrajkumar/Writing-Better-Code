#Question 

#input words = ['ptolemaic','retrograde', 'asymptote', 'babka']
#Output 2
#Code
# Binary search. 
# Kept splitting until the mid word was lesser than starting word.


def rotation_point(words)
  starting_index = 0
  ending_index = words.length - 1
  
  while starting_index < ending_index
    
    puts "\n#{words[starting_index]}"
    puts "#{words[ending_index]}"
    
    mid = (starting_index + ending_index) /2
    puts "#{mid}"
    puts "#{words[mid]}"
    if words[mid] < words[0]
      ending_index = mid 
    else
      starting_index = mid
    end
    
    return ending_index if starting_index + 1 == ending_index
  end
end


def test
  one = rotation_point([
    'ptolemaic',
    'retrograde',
    'supplant',
    'undulate',
    'xenoepist',
    'asymptote',  # <-- rotates here!
    'babka',
    'banoffee',
    'engender',
    'karpatka',
    'othellolagkage',
  ])
  
  two = rotation_point(['ptolemaic','retrograde', 'retrograde1', 'retrograde2', 'asymptote', 'babka'])
  puts "\nOne: Input: [10, 7, 5, 8, 11, 9] -> Output: #{one}"
  puts "\nTwo: Input: [10, 7, 100] -> Output: #{two}"
end

test
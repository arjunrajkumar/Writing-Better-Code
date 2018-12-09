#Question - https://adventofcode.com/2018/day/1

#Input - array of integers - e.g. +1, -2, +3, +1
#Output - integer - 3. 
#example. 0 > 1 > 1 ; 1 > -2 > -1 ; -1 > 3 > 2 ; 2 > 1 > 3 ;
#o[n] and o[n] space. 

require 'pry'

#Part 1
#logic
#Take the input. 
#iterate over each line in file and add accordingly. 

def chronal_calib_part1
  sum = 0
  
  File.open('advent_of_code/day1.txt', 'r') do |f|
    f.each_line do |line|
      sum += line.to_i
    end
  end  
  sum
end


#Part2
#logic
#Take the input. 
#iterate over loop and add accordingly.
#Store the sum as an index in a hash. 
#if index already exists. Break the loop. 
#Return the hash key
def chronal_calib_part2
  sum = 0
  frequency = {}
  found_frequency = false
  while found_frequency == false
    File.open('advent_of_code/day1.txt', 'r') do |f|
      f.each_line do |line|
        sum += line.to_i
        if frequency[sum] == true
          frequency[sum] = false
          found_frequency = true 
          break
        else
          frequency[sum] = true 
        end
      end
    end 
  end 
  puts frequency.key(false)
end

chronal_calib_part2

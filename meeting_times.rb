#Question - https://www.interviewcake.com/question/ruby/merging-ranges?section=sorting-searching-logarithms&course=fc1

#Inputs -   [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
#Output - [[0, 1], [3, 8], [9, 12]]

# Logic.
# Sort the meeting times in ascending order. 
# Then compare the ending meeting time with the starting of the next. 
# If it lesser, leave as is. If not lesser, use the next ones ending time, and merge.  
# Using sort and going the meetings once so its O[nlogn]
# Space is O[n]

require 'pry'

def meeting_times(meetings)
  meetings = meetings.sort
  answer = [meetings[0]]
  
  meetings[1..-1].each do |starting_time, ending_time|
    previous_starting_time, previous_ending_time = answer[-1]
    
    if starting_time > previous_ending_time
      answer << [starting_time, ending_time]
    else
      answer[-1] = [previous_starting_time, [ending_time, previous_ending_time].max]
    end
  end
  
  answer
end





def test
  one = meeting_times([[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]])
  puts "\nOne: Input: [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]] -> Output: #{one}"
end

test
#Question : https://www.interviewcake.com/question/ruby/top-scores?course=fc1&section=sorting-searching-logarithms

def sort_scores(unsorted_scores, highest_score)
  counts = [0] * (highest_score + 1)
  
  unsorted_scores.each do |score|
    counts[score] += 1
  end
  
  sorted_score = []
  highest_score.downto(1).each do |score|
    count = counts[score]
    
    (0...count).each do |i|
      sorted_score << score
    end
  end
  
  sorted_score
end


def test
  one = sort_scores([37, 89, 41, 65, 91, 33], 100)
  puts "\nOne: Input: [37, 89, 41, 65, 91, 33], 100 -> Output: #{one}"
end

test

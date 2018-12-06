#Question: https://www.interviewcake.com/question/ruby/single-riffle-check?section=greedy&course=fc1
#input: array shuffled_deck integeres range of 1..52. ; half1 & half2 of 26 cards each. 
#Logic 
#- Get the shuffled deck and check if card in shuffled deck alternated between half 1 and half 2. 

#-do while loop until shuffled deck is empty. 
#-pick a card from the shuffled deck - check if its the top card of half 1 or half2.
#-if it matches top of half1 - pop it from half1, pop from deck.
#-if the next shuffled card is top of half2, repeat. 
#- if the card does not match the top of either halves, its not a single shuffle.

def riffle_shuffle(shuffled_deck, half1, half2)
  
  while shuffled_deck.any? 
    card = shuffled_deck[-1]
    
    if half1.any? && card == half1[-1] 
      half1.pop
      shuffled_deck.pop
    elsif half2.any? && card == half2[-1] 
      half2.pop
      shuffled_deck.pop
    else
      break
    end
  end
  
  if shuffled_deck.any?
    false
  else
    true
  end
end

def test
  one = riffle_shuffle([1, 7, 3, 4, 5, 10], [1,7,3], [4,5,10])
  two = riffle_shuffle([1, 7, 3, 5, 4, 10], [1,7,3], [4,5,10])
  puts "\nOne: Input: [1, 7, 3, 4, 5, 10], [1,7,3], [4,5,10] -> Output: #{one}"
  puts "\nTwo: Input: [1, 7, 3, 5, 4, 10], [1,7,3], [4,5,10] -> Output: #{two}"
end

test





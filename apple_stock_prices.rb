#Question - https://www.interviewcake.com/question/ruby/stock-price?section=greedy&course=fc1
#Input: array stock_prices = [10, 7, 5, 8, 11, 9]
#Output: int 6 (buying for $5 and selling for $11)
#Examples: [10, 7, 5, 8, 11, 9] -> 6 ; [10, 7, 100, 8, 11, 9] -> 92 ; [10] -> 0 ; [10, 2] -> 0.
#Logic: 
# - Go thru each price one by one. 
# - See if the current stock is lesser than previous min_stock stored variable. 
# - See if the profit is greater than max profit stored. (current_stock - min_stock)  
# - Going thru the loop once so it is O[n] time
# - O[1] space as storing fixed.


def get_max_profit(stock_prices)
  return 0 if stock_prices.length < 2
  
  min_stock = stock_prices[0]
  max_profit = stock_prices[1] - stock_prices[0]
  puts "\n#{min_stock}"
  puts "#{max_profit}"
  stock_prices[1...stock_prices.length].each do |price|
    min_stock = [min_stock, price].min 
    puts "\n#{min_stock}"
    pot_max_profit = price - min_stock
    puts "#{max_profit}"
    max_profit = [max_profit, pot_max_profit].max
    puts "#{max_profit}"
  end
  
  max_profit
end


 
def test
  one = get_max_profit([10, 7, 5, 8, 11, 9])
  two = get_max_profit([10, 7, 100, 8, 11, 9])
  three = get_max_profit([10])
  four = get_max_profit([10, 2])
  
  puts "\nOne: Input: [10, 7, 5, 8, 11, 9] -> Output: #{one}"
  puts "\nTwo: Input: [10, 7, 100, 8, 11, 9] -> Output: #{two}"
  puts "\nThree: Input: [10] -> Output: #{three}"
  puts "\nFour: Input: [10, 2] -> Output: #{four}"
end

test
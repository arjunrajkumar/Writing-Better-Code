#Question - https://www.interviewcake.com/question/ruby/mesh-message?section=trees-graphs&course=fc1

require 'pry'

def send_a_message(network, sender, receiver)
  neighbours = network[sender]
  
  already_seen = []
  neighbours_to_check = []
  path_to = {}
  path_exists = false
  
  neighbours_to_check << sender
  already_seen << sender
  path_to[sender] = nil
  
  until neighbours_to_check.empty?
    current = neighbours_to_check.pop
    
    if current == receiver
      path_exists = true
      break
    end
    
    network[current].each do |person|
      next if already_seen.include? person
      
      already_seen << person
      neighbours_to_check << person
      path_to[person] = current
    end
  end
  
  if path_exists
    actual_path = []
    current = receiver
    
    while current
      actual_path << current
      current = path[current]
    end 
    
    return actual_path
  else
    nil
  end
end



test


#A better approach is to use a queue instead of an array. FIFO. O[1]. Array has O[1] insert but O[n] lookup.


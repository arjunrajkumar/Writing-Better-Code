#Question: https://www.interviewcake.com/question/ruby/bst-checker?section=trees-graphs&course=fc1

#Input: binary tree - a binary tree is a tree where every node has two or fewer children. 
#Output - Boolean - check if it is a binary search tree .. 

#Logic
#Do a Depth first search for the tree
#Then get the child node for each parent node.
#If the child node is on the left, its value has to be lesser than all parents. 
#If the child node is on the right, its value has to be great than all parents.
#So as you go down each node, store the lowest_value and the highest_value.
#Then check if the current is less than the lowest_number (for left side) - and do accordingly for right side. 
#return false if condition not met. 


def binary_search_tree(one_tree)
  
  nodes = []
  nodes.push([one_tree, -Float::INFINITY, Float::INFINITY])
  
  while nodes.any?  
    node, lowest_number, highest_number = nodes.pop
    
    return false if ((node.current_value <= lowest_number) || (node.current_value >= highest_number))
    
    nodes.push([node.left, lowest_number, node.current_value]) if node.left
    nodes.push([node.left, node.current_value, highest_number]) if node.right
  end 
  true
end

#This is O[n] time
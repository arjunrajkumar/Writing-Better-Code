#question https://www.interviewcake.com/question/ruby/second-largest-item-in-bst?section=trees-graphs&course=fc1

#Logic
#The right most item will be the largest. 
#The second largest could be one of these: 
#1 - if the current node has only one left-subtree, then the second largest could be the right most child of that sub-tree
#2 - it's parent (

def largest(root)
  if root.any? && root.right
    return largest(root.right) 
  end
  
  return root.value
end

def second_largest(root)
  return largest(root.left) if root.any? && (root.left && !root.right)
  
  return root.value if root.any? && (!root.left && !root.right)
  
  #if both of them are false then go right
  return second_largest(root.right)
end

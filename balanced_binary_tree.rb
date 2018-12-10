#Question :Write a method to see if a binary tree ↴ is "superbalanced" (a new tree property we just made up).
#A tree is "superbalanced" if the difference between the depths of any two leaf nodes is no greater than one.

def super_balanced(tree)
  if !tree
    return true
  end
  
  depths = []
  nodes = []
  nodes.push([tree, 0])
  
  while !nodes.empty?
    node, depth = nodes.pop
    
    if !node.left && !node.right
      if !depths.include? depth
        depths.push(depth)
        
        if (depths.length > 2) || (depths.length == 2 && (depths[0] - depths[1]).abs > 1)
          return false
        end
      
      end
    else
      if node.left
        nodes.push([node.left, depth+1])
      end
      if node.right
        nodes.push([node.right, depth+1])
      end
    end
  end
  
  return true 
end

#Complexity O(n) time and O(n)O(n) space.
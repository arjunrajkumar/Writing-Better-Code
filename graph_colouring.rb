#question - https://www.interviewcake.com/question/ruby/graph-coloring?course=fc1&section=trees-graphs

#Logic:
#- Each node in the graph has maximum D neighbours.
#- Given than there are maximum D+1 colours, we can assume that for each node there is atleast one color that is not used. 
#- Go thru each node and get the colors of all its neighbours. 
#- Check to see which color is not included in this neighbouring color group, and assign the color to it. 

def colour_graoh(colors, graph)
  graph.nodes.each do |node|
    
    all_neighbouring_colors = []
    
    node.neighbours.each do |neighbour|
      all_neighbouring_colors << neighbour.color if !all_neighbouring_colors.include?(neighbour.color)
    end
    
    colors.each do |color|
      node.color = color if !all_neighbouring_colors.include?(color)
      break
    end
end
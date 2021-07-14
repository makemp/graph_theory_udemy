class TreeNode < Struct.new(:children, :num, :parent)
  def inspect
    "Num: #{num}, parent: #{parent.inspect}, \n children: #{children}"
  end
end

class TreeBuilder
  def initialize(graph_string, number_of_nodes)
    @graph_string = graph_string
    @number_of_nodes = number_of_nodes
    @visited = []
  end

  def build(list = nil, parent_node = nil, parent_node_index = 0)
    return if visited.include?(parent_node_index)
    visited << parent_node_index
    list = AdjacencyListBuilder.new(number_of_nodes, graph_string).call unless list
    parent_node = TreeNode.new unless parent_node
    parent_node.num = parent_node_index
    parent_node.children = list[parent_node_index].map { |n| build(list, TreeNode.new.tap { |t| t.parent = parent_node_index }, n) }
    parent_node
  end

  private

  attr_reader :graph_string, :number_of_nodes, :visited
end

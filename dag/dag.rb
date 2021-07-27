# DAG - Directed Acyclic Graph
#

class Dag
  def initialize(number_of_nodes, graph)
    @number_of_nodes = number_of_nodes
    @graph = graph
  end

  def shortest_path(start_node: 0, factor: 1) # single source shortest Path (SSSP) - meet all nodes
    top_sorted = TopSort.new(number_of_nodes, graph).call

    distances = []

    distances[start_node] = 0

    (0...number_of_nodes).each do |i|
      node_index = top_sorted[i]
      if distances[node_index]
        adjacent_edges = graph[node_index]
        adjacent_edges.each do |edge|
          new_distance = distances[node_index] + edge.label * factor
          distances[edge] = distances[edge] ? [distances[edge], new_distance].min : new_distance
        end
      end
    end

    distances.map { |d| d * factor }
  end

  def longest_path(start_node: 0)
    shortest_path(start_node: start_node, factor: -1) # trick with factor to find longest path
  end

  private

  attr_reader :number_of_nodes, :graph
end

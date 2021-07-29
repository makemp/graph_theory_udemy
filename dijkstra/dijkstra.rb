class Dijkstra
  def initialize(graph, number_of_nodes)
    @graph = graph
    @number_of_nodes = number_of_nodes
  end

  def eager(starting_node_index, end_node: nil)
    visited  = Array.new(number_of_nodes)
    distances = Array.new(number_of_nodes) {Float::INFINITY}
    prev = Array.new(number_of_nodes) # tracking down the path

    distances[starting_node_index] = 0
    ipq = MinIndexedDHeap.new(number_of_nodes / 2, number_of_nodes) # indexed priority queue
    ipq.insert(starting_node_index, 0)

    while !ipq.empty? do
      index, min_value = ipq.poll
      visited[index] = true
      next if distances[index] < min_value
      graph[index].each do |node|
        next if visited[node]
        new_dist = distances[index] + node.label
        if new_dist < distances[node]
          prev[node] = index
          distances[node] = new_dist
          if ipq.contains?(node)
            ipq.decrease(node, new_dist)
          else
            ipq.insert(node, new_dist)
          end
        end
        break if end_node && node == end_node
      end
    end
    distances = end_node ? distances[end_node] : distances

    { prev: prev, distances: distances }
  end

  def find_shortest_path(star_node, end_node, optimisation: false)
    prev, dist = eager(star_node, end_node: optimisation ? end_node : nil).values
    path = []
    return -1 if dist[end_node] == Float::INFINITY
    at = end_node
    while at
      path.push(at)
      at = prev[at]
    end
    path.reverse
  end
  private

  attr_reader :graph, :number_of_nodes
end

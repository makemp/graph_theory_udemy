# DFS stands for Depth First Search algorithm. O(V+E) complexity V -vertices E -edges

class DFS
  LETTERS = %w(a b c d e f g h i j k l m)
  attr_writer :ordering

  def initialize(n, graph, visited = nil)
    @n = n # number of nodes in the graph
    @graph = graph # adjacency list representing graph - which node is connected with which. Starting from 0 node.
    @visited = visited || Array.new(n) # array of nils
  end

  def call
    dfs(0)
    self
  end

  def dfs(at, &block)
    return if visited[at]
    block.call(at) if block_given? # do more things here help to reuse algorithm
    visited[at] = true

    neighbours = graph[at]
    return unless neighbours
    neighbours.each { |node_number| dfs(node_number, &block) }
  end

  def dfs_topsort(i, at)
    visited[at] = true
    neighbours = graph[at] || []
    neighbours.each do |edge_to|
      i = dfs_topsort(i, edge_to) unless visited[edge_to]
    end
    ordering[i] = at
    i - 1
  end

  def connected_graph?
    visited.all?
  end

  private

  attr_reader :n, :graph, :visited, :ordering
end

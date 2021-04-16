# DFS stands for Depth First Search algorithm. O(V+E) complexity V -vertices E -edges

class DFS
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

  def connected_graph?
    visited.all?
  end

  class Examples
    class << self

      def run
        example1
        example2
        example3
        example4
      end

      def example1
        puts 'Connected - spider web - 5 elements'

        n = 5
        graph = [[1, 2, 3, 4], #first element (0) is connected with all and same for others
                 [0, 2, 3, 4],
                 [0, 1, 3, 4],
                 [0, 1, 2, 4],
                 [0, 1, 2, 3]]
        dfs = DFS.new(n, graph).call
        puts dfs.connected_graph?
      end

      def example2
        puts 'Not fully connected - 5 elements'
        n = 5
        graph = [[1, 2, 4], # forth element (3) has no connections
                 [0, 2, 4],
                 [0, 1, 4],
                 [],
                 [0, 1, 2]]
        dfs = DFS.new(n, graph).call
        puts dfs.connected_graph?
      end

      def example3
        puts 'Connected - like a tree'
        n = 5
        graph = [[1, 2], [], [3, 4], [], []]
        dfs = DFS.new(n, graph).call
        puts dfs.connected_graph?
      end

      def example4
        puts 'Not connected - two groups of nodes'

        n = 5
        graph = [[1],[0],[3,4],[2,4],[2,3]]

        dfs = DFS.new(n, graph).call
        puts dfs.connected_graph?
      end
    end
  end

  private

  attr_reader :n, :graph, :visited
end

# Finding connected components of the graph using dfs

require_relative 'dfs'
class ConnectedComponents
  attr_reader :components

  def initialize(n, graph)
    @n = n
    @graph = graph
    @count = 0 # this helps to "mark" groups of nodes. First group is 1 group, second is 2 and so on
    @components = Array.new(n) # if components[3] returns 1
    @visited = Array.new(n)
  end

  def group_components
    (0...n).each do |num|
      unless visited[num]
        @count += 1
        DFS.new(n, graph, visited).dfs(num) do |at|
          components[at] = @count
        end
      end
    end
    self
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
        puts 'two groups of nodes'

        n = 5
        graph = [[1],[0],[3,4],[2,4],[2,3]]

        cc = ConnectedComponents.new(n, graph).group_components
        puts cc.components
      end

      def example2
        puts 'two group of nodes - just one alone'

        n = 5
        graph = [[1, 2, 4], # forth element (3) has no connections
                 [0, 2, 4],
                 [0, 1, 4],
                 [],
                 [0, 1, 2]]

        cc = ConnectedComponents.new(n, graph).group_components
        puts cc.components
      end

      def example3
        puts 'Connected - like a tree - one group'
        n = 5
        graph = [[1, 2], [], [3, 4], [], []]

        cc = ConnectedComponents.new(n, graph).group_components
        puts cc.components
      end

      def example4
        puts "five groups"

        n = 10
        graph = [[1],[0],[3,4],[2,4],[2,3],[],[], [8,9], [7,9], [7,7]]

        cc = ConnectedComponents.new(n, graph).group_components
        puts cc.components
      end
    end
  end

  attr_reader :n, :graph, :visited
end

class DFS::ConnectedComponents::Examples
  class << self

    def example1
      puts 'two groups of nodes'

      n = 5
      graph = [[1],[0],[3,4],[2,4],[2,3]]

      cc = ::DFS::ConnectedComponents.new(n, graph).group_components
      puts cc.components.inspect
    end

    def example2
      puts 'two group of nodes - just one alone'

      n = 5
      graph = [[1, 2, 4], # forth element (3) has no connections
               [0, 2, 4],
               [0, 1, 4],
               [],
               [0, 1, 2]]

      cc = ::DFS::ConnectedComponents.new(n, graph).group_components
      puts cc.components.inspect
    end

    def example3
      puts 'Connected - like a tree - one group'
      n = 5
      graph = [[1, 2], [], [3, 4], [], []]

      cc = ::DFS::ConnectedComponents.new(n, graph).group_components
      puts cc.components.inspect
    end

    def example4
      puts "five groups"

      n = 10
      graph = [[1],[0],[3,4],[2,4],[2,3],[],[], [8,9], [7,9], [7,7]]

      cc = ::DFS::ConnectedComponents.new(n, graph).group_components
      puts cc.components.inspect
    end
  end
  extend ExamplesHelper
end

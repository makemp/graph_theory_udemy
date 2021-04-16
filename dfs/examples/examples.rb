class DFS::Examples
  class << self

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
  extend ::ExamplesHelper
end

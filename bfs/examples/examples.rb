class BFS::Examples
  class << self
    def example1
      puts 'twelve nodes - tricky example - 0, 1, 2, 10, 9, 11'

      number_of_nodes = 12
      graph_string = %(0 1
1 2
0 3
3 4
4 5
5 6
6 7
6 8
7 9
9 10
2 10
9 11)

      graph = AdjacencyUndirectedListBuilder.new(number_of_nodes, graph_string).call

      puts BFS.new(number_of_nodes, graph).bfs(0, 11).inspect
    end

    def example2
      puts '14 nodes - not connected - []'

      number_of_nodes = 14
      graph_string = %(0 1
1 2
0 3
3 4
4 5
5 6
6 7
6 8
7 9
9 10
2 10
9 11
12 13)
      graph = AdjacencyUndirectedListBuilder.new(number_of_nodes, graph_string).call
      puts BFS.new(number_of_nodes, graph).bfs(3, 12).inspect
    end
  end
  extend ExamplesHelper
end

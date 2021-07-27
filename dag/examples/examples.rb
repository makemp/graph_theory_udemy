class ::Dag::Examples
  class << self
    def example1
      puts 'shortest path DAG - should be [0, 3, 6, 7, 3, 12, 9, 11]'
      graph_string = %(0 1 3
0 2 6
1 2 4
1 3 4
1 4 11
2 3 8
2 6 11
3 4 -4
3 5 5
3 6 2
4 7 9
5 7 1
6 7 2)

      number_of_nodes = 8

      graph = AdjacencyListBuilder.new(number_of_nodes, graph_string).call(directed: true)

      puts Dag.new(number_of_nodes, graph).shortest_path.inspect
    end

    def example2
      puts 'longest path DAG - should be [0, 3, 7, 15, 14, 20, 18, 23]'
      graph_string = %(0 1 3
0 2 6
1 2 4
1 3 4
1 4 11
2 3 8
2 6 11
3 4 -4
3 5 5
3 6 2
4 7 9
5 7 1
6 7 2)

      number_of_nodes = 8

      graph = AdjacencyListBuilder.new(number_of_nodes, graph_string).call(directed: true)

      puts Dag.new(number_of_nodes, graph).longest_path.inspect
    end
  end
  extend ::ExamplesHelper
end

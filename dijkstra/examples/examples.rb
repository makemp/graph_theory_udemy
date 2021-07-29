class Dijkstra::Examples
  class << self

    def example1
      puts 'Dijkstra - example1, distances: [0, 4, 1, 7, 9, 10]'
      graph_string = %(0 1 5
0 2 1
1 2 2
2 1 3
2 4 12
1 3 3
1 4 20
3 4 2
3 2 3
4 5 1
3 5 6)

      number_of_nodes = 6

      graph = AdjacencyListBuilder.new(number_of_nodes, graph_string).call(directed: true)


      puts Dijkstra.new(graph, number_of_nodes).eager(0)[:distances].inspect
    end


    def example2
      puts 'Dijkstra - find actual shortest path -> [0, 2, 1, 3, 4, 5]'

      graph_string = %(0 1 5
0 2 1
1 2 2
2 1 3
2 4 12
1 3 3
1 4 20
3 4 2
3 2 3
4 5 1
3 5 6)

      number_of_nodes = 6

      graph = AdjacencyListBuilder.new(number_of_nodes, graph_string).call(directed: true)

      puts Dijkstra.new(graph, number_of_nodes).find_shortest_path(0, 5).inspect
    end

    def example3
      puts 'Dijkstra - example1, optimal distance is 10'
      graph_string = %(0 1 5
0 2 1
1 2 2
2 1 3
2 4 12
1 3 3
1 4 20
3 4 2
3 2 3
4 5 1
3 5 6)

      number_of_nodes = 6

      graph = AdjacencyListBuilder.new(number_of_nodes, graph_string).call(directed: true)


      puts Dijkstra.new(graph, number_of_nodes).eager(0, end_node: 5)[:distances].inspect
    end

    def example4
      puts 'Dijkstra - shortest path with optimisation -> [0, 2, 1, 3]'

      graph_string = %(0 1 5
0 2 1
1 2 2
2 1 3
2 4 12
1 3 3
1 4 20
3 4 2
3 2 3
4 5 1
3 5 6)

      number_of_nodes = 6

      graph = AdjacencyListBuilder.new(number_of_nodes, graph_string).call(directed: true)

      puts Dijkstra.new(graph, number_of_nodes).find_shortest_path(0, 3, optimisation: true).inspect
    end
  end

  extend ::ExamplesHelper
end

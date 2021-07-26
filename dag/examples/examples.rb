class ::Dag::Examples
  class << self
    def example1
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
      puts graph.inspect
      top_sorted = TopSort.new(number_of_nodes, graph).call
      puts top_sorted.inspect
    end

    def example2
    end
  end
  extend ::ExamplesHelper
end

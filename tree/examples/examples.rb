class Tree::Examples
  class << self
    def example1
      puts 'Simple example - center is 2'

      number_of_nodes = 6
      graph_string = %(0 2
0 5
1 4
2 3
2 4)

      graph = AdjacencyUndirectedListBuilder.new(number_of_nodes, graph_string).call

      puts Tree::Center.new(number_of_nodes, graph).center.inspect
    end
    def example2
      puts 'More complicated - center is 3'

      number_of_nodes = 14
      graph_string = %(0 2
7 1
8 3
9 2
10 5
0 5
1 4
2 3
2 6
7 8
0 11
11 13
11 12)

      graph = AdjacencyUndirectedListBuilder.new(number_of_nodes, graph_string).call

      puts Tree::Center.new(number_of_nodes, graph).center.inspect
    end

    def example3
      puts 'Two centers - 3, 1'

      number_of_nodes = 10
      graph_string = %(0 1
1 3
1 4
4 5
4 8
3 2
3 7
3 6
6 9)
      graph = AdjacencyUndirectedListBuilder.new(number_of_nodes, graph_string).call
      puts Tree::Center.new(number_of_nodes, graph).center.inspect
    end

    def example4
      puts 'spaghetti test'

      number_of_nodes = 5
      graph_string = %(0 1
1 2
2 3
3 4)
      graph = AdjacencyUndirectedListBuilder.new(number_of_nodes, graph_string).call
      puts Tree::Center.new(number_of_nodes, graph).center.inspect
    end
  end


  extend ExamplesHelper
end

require_relative '../tree_builder'

class ::TreeBuilder::Examples
  class << self
    def example1
      n = 10
      graph_string = %(0 1
0 2
2 3
2 4
2 5
5 6
5 7
7 8
8 9)
      puts ::TreeBuilder.new(graph_string, n).build.inspect
    end
  end
  extend ::ExamplesHelper
end

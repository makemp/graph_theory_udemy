class KruskalsMinimumSpanningTree::Examples
  class << self
    def example1
      puts 'Example from https://www.udemy.com/course/introduction-to-data-structures/learn/lecture/7261036#overview'
      puts 'expected to be 14'

      input = GraphConverter.from_letters_to_ints(
        [
          ['I', 'J', 0],
          ['A', 'E', 1],
          ['C', 'I', 1],
          ['E', 'F', 1],
          ['G', 'H', 1],
          ['B', 'D', 2],
          ['C', 'J', 2],
          ['D', 'E', 2],
          ['D', 'H', 2],
          ['A', 'D', 4],
          ['B', 'C', 4],
          ['C', 'H', 4],
          ['G', 'I', 4],
          ['A', 'B', 5],
          ['D', 'F', 5],
          ['H', 'I', 6],
          ['F', 'G', 7],
          ['D', 'G', 11]
        ].shuffle
      )
      puts KruskalsMinimumSpanningTree.new(input).call
    end
  end
  extend ExamplesHelper
end

# A 0
# B 1
# C 2
# D 3
# E 4
# F 5
# G 6
# H 7
# I 8
# J 9
# K 10
# L 11
# M 12


class TopSort::Examples
  class << self
    def example1
      puts 'Example from the course. Should be ["c", "b", "e", "f", "k", "a", "d", "g", "h", "i", "j", "l", "m"] with given input and order.'

      graph_string = %(0 3
1 3
2 0
2 1
3 6
3 7
4 0
4 3
4 5
5 9
5 10
6 8
7 9
7 8
8 11
9 12
9 11
10 9)

      number_of_nodes = 13

      graph = AdjacencyListBuilder.new(number_of_nodes, graph_string).call(directed: true)

      letters = %w(a b c d e f g h i j k l m)

      results = TopSort.new(number_of_nodes, graph).call([7, 4, 2, 0, 1,3,5,6,8,9,10,11,12])

      puts results.map { |num| letters[num] }.inspect
    end
  end

  extend ::ExamplesHelper
end

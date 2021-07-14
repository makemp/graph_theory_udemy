# This should translate format of https://csacademy.com/app/graph_editor/ to adjacency list format - 0-indexed - undirected
#
#
#  graph_string format:
# 0 1
# 1 2
# 1 3
# 2 3
# 3 4
# 4 5
# 5 6
# 7
class AdjacencyListBuilder
  def initialize(n, graph_string)
    @n = n # node count
    @graph_string = graph_string
    @adjacency_list = Array.new(n) { [] }
  end

  def call(directed: false)
    parsed_graph_string.each do |pair|
      # first element is node number, second which element it connects
      index, connected_with = pair.map(&:to_i)
      if connected_with
        adjacency_list[index].push connected_with
        adjacency_list[connected_with].push index unless directed
      end
    end
    adjacency_list
  end

  private

  attr_reader :n, :graph_string, :adjacency_list

  def parsed_graph_string
    @parsed_graph_string ||= graph_string.split("\n").map { |pair| pair.split(' ') }
  end
end



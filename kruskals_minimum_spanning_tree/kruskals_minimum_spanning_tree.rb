class KruskalsMinimumSpanningTree
  def initialize(graph)
    @graph = graph.sort_by { |node| node.last }
    @disjoint_set = MaciejDataStructures::DisjointSet.new(graph.size)
  end

  def call
    graph.inject(0) do |memo, node|
      from, to, value = node
      memo += value if disjoint_set.unify(from, to)
      memo
    end
  end

  private

  attr_reader :graph, :disjoint_set
end

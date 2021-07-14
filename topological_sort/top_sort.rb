class TopSort
  def initialize(n, graph)
    @n = n # number of nodes in the graph
    @graph = graph # adjacency list representing graph - which node is connected with which. Starting from 0 node.
    @visited = Array.new(n) # array of nils
    @ordering = Array.new(n)
  end

  def call(custom_nodes_order = nil)
    i = @n - 1
    (custom_nodes_order || (0..i)).each do |num|
      unless visited[num]
        dfs = DFS.new(n, graph, visited)
        dfs.ordering = ordering
        i = dfs.dfs_topsort(i, num)
      end
    end

    ordering
  end

  private

  attr_reader :n, :graph, :visited, :ordering
end

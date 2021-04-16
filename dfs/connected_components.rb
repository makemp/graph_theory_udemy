# Finding connected components of the graph using dfs

class DFS::ConnectedComponents
  attr_reader :components

  def initialize(n, graph)
    @n = n
    @graph = graph
    @count = 0 # this helps to "mark" groups of nodes. First group is 1 group, second is 2 and so on
    @components = Array.new(n) # if components[3] returns 1
    @visited = Array.new(n)
  end

  def group_components
    (0...n).each do |num|
      unless visited[num]
        @count += 1
        DFS.new(n, graph, visited).dfs(num) do |at|
          components[at] = @count
        end
      end
    end
    self
  end

  attr_reader :n, :graph, :visited
end

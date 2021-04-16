# Breadth First Search algorithm. O(V+E) complexity V -vertices E -edges
#  Finding shortest path on unweighted graphs

class BFS
  def initialize(n, graph)
    @n = n # number of nodes in the graph
    @graph = graph # adjacency list representing graph - which node is connected with which. Starting from 0 node.
  end

  def bfs(start_node, end_node) # 0 <= e, s < n
    prev = solve(start_node) # do actual bfs

    reconstruct_path(start_node, end_node, prev)
  end

  def solve(start_node)
    q = Queue.new
    q.enqueue(start_node)

    visited = Array.new(n, false)
    visited[start_node] = true

    prev = Array.new(n)

    until q.empty?
      node = q.dequeue
      neighbours = graph[node]

      neighbours.each do |next_node|
        unless visited[next_node]
          q.enqueue(next_node)
          visited[next_node] = true
          prev[next_node] = node
        end
      end
    end

    prev
  end

  def reconstruct_path(start_node, end_node, prev) # actual finding shortest path
    path = []
    at = end_node # going backwards
    while prev[at]
      path.push(at)
      at = prev[at]
    end

    path.push(at) # entry node
    path.reverse!

    path[0] == start_node ? path : [] # if they are really connected, otherwise return []
  end

  class Queue
    ENQUEUE = 'enqueue'
    DEQUEUE = 'dequeue'

    def initialize
      @q = {}
    end

    def enqueue(node_number)
      q[node_number] = 'enqueue'
    end

    def dequeue
      node_number = q.detect { |_index, val| val == ENQUEUE }&.first || raise('Something went wrong as it is not found')
      q[node_number] = DEQUEUE
      node_number
    end

    def empty?
      q.all? { |_index, val| val == DEQUEUE } || q.keys == []
    end

    private

    attr_reader :q
  end

  private

  attr_reader :n, :graph
end

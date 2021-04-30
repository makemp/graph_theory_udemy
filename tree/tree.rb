# frozen_string_literal: true

# A tree is an (undirected) graph with no cycles.
# A tree it is a connected graph with N nodes and N-1 edges.

# Binary Search Tree (BST)
# Every node x:
# x.left.value <= x.value <= x.right.value - require uniqueness by using `<`

class Tree
  Node = Struct.new(:nodes, :num)

  class Center
    def initialize(number_of_nodes, graph)
      @number_of_nodes = number_of_nodes
      @graph = graph
      @degree = Array.new(number_of_nodes, 0)
    end

    def center
      leaves = []
      graph.each_with_index do |node, index| # node is an array of elements! (Adjacency List)
        degree[index] = node.size
        if degree[index] < 2
          leaves << index
          degree[index] = 0
        end
      end  # end of determining which are leaves at the beginning

      number_of_leaves = leaves.size

      while number_of_leaves < number_of_nodes
        new_leaves = []
        leaves.each do |leaf|
          graph[leaf].each do |neighbor|
            degree[neighbor] -= 1
            if degree[neighbor] == 1
              new_leaves << neighbor
            end
          end
          degree[leaf] = 0
        end

        number_of_leaves += new_leaves.size
        leaves = new_leaves
      end

      leaves
    end

    attr_reader :number_of_nodes, :graph, :degree
  end

  class SumOfNodes
    def initialize
      @tree = Node.new([
                         Node.new(
                           [Node.new(nil, 1),
                            Node.new(nil, 5),
                            Node.new(
                              [
                                Node.new(
                                  [Node.new(nil, 5)], 6
                                )
                              ], 2
                            )], 6
                         ), Node.new(nil, 3)
                       ], 2)
    end

    def sum(node = @tree)
      return node.num unless node.nodes

      node.num + node.nodes.inject(0) { |memo, n| memo + sum(n) }
    end
  end

  class HeightOfTree # count edges height(x) = max(height(x.left),height(x.right)) --> recursive, binary
    def initialize
      @tree = Node.new([
                         Node.new([Node.new, Node.new, Node.new([Node.new([Node.new])])]), Node.new
                       ])
    end

    def height(node = @tree)
      return 0 unless node.nodes

      node.nodes.map { |n| height(n) }.max + 1
    end
  end
end

class MinIndexedDHeap # TODO: actual implementation of MinIndexedDHeap -> Indexed Priority Queue
  def initialize(edges_count,  nodes_count)
    @h = {}
    @degree = edges_count/nodes_count
  end


  def insert(key, value)
    h[key] = value
  end

  def peek_min_key_index

  end

  def poll # actually removes key/index values, looking for the most promising node (min_val)
    min_val = h.values.min
    key_and_value = h.select { |_, v| v == min_val }
    h.delete(key_and_value.first.first)
    key_and_value.first
  end

  def empty?
    h.size == 0
  end

  def decrease(key, value) # update only if value is smaller
    h[key] = value if value < h[key]
  end

  def contains?(key)
    h[key]
  end

  # helpers

  attr_reader :h, :degree

  def inspect
    @h.inspect
  end
end

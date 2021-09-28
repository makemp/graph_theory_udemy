class GraphConverter
  LETTERS = ('A'..'Z')
  LETTERS_WITH_INDEX = LETTERS.each_with_object({}).with_index { |(el, memo), index| memo[el] = index}

  class << self
    def from_letters_to_ints(graph)
      convert(graph) { |letter| LETTERS_WITH_INDEX[letter] }
    end

    def from_ints_to_letters(graph)
      convert(graph) { |int| LETTER[int] }
    end

    private

    def convert(graph)
      graph.each_with_object([]) do |node, memo|
        from, to, label = node
        memo << [ yield(from), yield(to), label ]
      end
    end
  end
end

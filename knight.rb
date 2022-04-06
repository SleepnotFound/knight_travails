# frozen_string_literal: true

class Knight
  attr_reader :pos, :children, :parent

  P_MOVES = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].freeze

  def initialize(position, parent = nil)
    @pos = position
    @children = []
    @parent = parent
  end
end

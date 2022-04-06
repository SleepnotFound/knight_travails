class Knight
  attr_accessor :pos, :children, :parent

  P_MOVES = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]

  def initialize(position, parent = nil)
    @pos = position
    @children = []
    @parent = parent
  end

end

class ChessBoard
  def knight_moves(start, destination)
    queue = [Knight.new(start)]
    visited = []
    current = queue.shift
    until current.pos == destination
      make_children(current)
      current.children.each { |child| queue.push(child)}
      current = queue.shift
    end
    until current.parent.nil?
      visited << current.pos
      current = current.parent
    end
    visited << current.pos
    print_results(visited)
  end

  def make_children(parent)
    Knight::P_MOVES.each do |move|
      child = [parent.pos[0] + move[0], parent.pos[1] + move[1]]
      parent.children.push(Knight.new(child, parent)) if child.all? { |n| n.between?(0,7)}
    end
  end

  def print_results(visited)
    puts "You made it in #{visited.length - 1} moves!"
    puts "Path taken: #{visited.reverse}"
  end
end

game = ChessBoard.new
game.knight_moves([3,3],[3,3])
game.knight_moves([3,3],[4,3])
game.knight_moves([0,0],[0,7])
# frozen_string_literal: true

class ChessBoard
  def knight_moves(start, destination)
    queue = [Knight.new(start)]
    current = queue.shift
    until current.pos == destination
      make_children(current)
      current.children.each { |child| queue.push(child) }
      current = queue.shift
    end
    visited = fill_visit_list(current)
    print_results(visited)
  end

  def make_children(parent)
    Knight::P_MOVES.each do |move|
      child = [parent.pos[0] + move[0], parent.pos[1] + move[1]]
      parent.children.push(Knight.new(child, parent)) if child.all? { |n| n.between?(0, 7) }
    end
  end

  def fill_visit_list(current)
    visited = []
    until current.parent.nil?
      visited << current.pos
      current = current.parent
    end
    visited << current.pos
  end

  def print_results(visited)
    puts "You made it in #{visited.length - 1} moves!"
    puts "Path taken: #{visited.reverse}"
  end
end

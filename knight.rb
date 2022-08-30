# frozen_string_literal: false

class Knight
  def knight_moves(start, finish)
    puts 'move' if valid_move?(start, finish)
  end

  def valid_move?(start, finish)
    if !(0..7).include?(start[0]) || !(0..7).include?(start[1])
      puts 'Start position must be between [0, 0] and [7, 7].'
      false
    elsif !(0..7).include?(finish[0]) || !(0..7).include?(finish[1])
      puts 'Finish position must be between [0, 0] and [7, 7].'
      false
    else
      true
    end
  end

  def available_moves(start)
    x, y = start
    moves = [[x - 1, y + 2],
             [x - 1, y - 2],
             [x + 1, y + 2],
             [x + 1, y - 2],
             [x - 2, y + 1],
             [x - 2, y - 1],
             [x + 2, y + 1],
             [x + 2, y - 1]]
    moves.filter! { |move| (0..7).include?(move[0]) && (0..7).include?(move[1]) }
  end
end

game = Knight.new
# game.knight_moves([0, 8], [0, 0])
p game.available_moves([0, 0])

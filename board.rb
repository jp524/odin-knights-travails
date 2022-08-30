# frozen_string_literal: false

# Display chess board and the current position of the knight
class Board
  def initialize
    @board = Array.new(8) { Array.new(8) { ' ' } }
  end

  def display
    puts "     #{(0..7).to_a.join('   ')}"
    puts '   ---------------------------------'
    @board.each_with_index do |row, i|
      puts " #{i} | #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[5]} | #{row[6]} | #{row[7]} |"
      puts '   ---------------------------------'
    end
  end

  def place_knight(position)
    if !(0..7).include?(position[0]) || !(0..7).include?(position[1])
      puts 'Position must be between [0, 0] and [7, 7]'
    else
      @board[position[0]][position[1]] = 'X'
    end
  end
end

board = Board.new
board.place_knight([5, 0])
board.display

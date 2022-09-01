# frozen_string_literal: false

# Display a chess board and the moves made by the knight
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

  def place_knight(path)
    path.each_with_index do |move, i|
      @board[move[0]][move[1]] = i
    end
  end
end

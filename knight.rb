# frozen_string_literal: false

# Creates a node containing data and its children
class Node
  attr_accessor :data, :children

  def initialize(data)
    @data = data
    @children = []
  end
end

# Generates the availables moves from a starting position
class Knight
  attr_reader :root

  def initialize
    @root = []
  end

  def knight_moves(start, finish)
    @root = Node.new(start) if valid_move?(start, finish)
    build_tree
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
    moves
  end

  def build_tree(root = @root, counter = 0)
    return if counter == 3

    counter += 1
    children = available_moves(root.data)
    children.each do |child|
      node = Node.new(child)
      root.children << node
      build_tree(node, counter)
    end
  end
end

game = Knight.new
game.knight_moves([0, 0], [3, 1])
p game.root

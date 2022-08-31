# frozen_string_literal: false

# Creates a node containing data and its children
class Node
  attr_accessor :data, :children, :parent

  def initialize(data)
    @data = data
    @children = []
    @parent = nil
  end
end

# Generates the availables moves from a starting position
class Knight
  attr_reader :root

  def initialize
    @root = []
    @finish_node = nil
    @counter_max = 2
  end

  def knight_moves(start, finish)
    return unless valid_move?(start, finish)

    @root = Node.new(start)
    build_tree
    level_order { |node| @finish_node = node if node.data == finish }

    if !@finish_node.nil?
      path = path_to_start(@finish_node) << @root.data
      puts "You made it in #{path.length - 1} moves! Here's your path:"
      path.reverse.each { |node| p node }
    else
      @counter_max += 2
      knight_moves(start, finish)
    end
  end

  def path_to_start(node = finish_node, path = [])
    return if node == @root

    path << node.data
    path_to_start(node.parent, path)
    path
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
    return if counter == @counter_max

    counter += 1
    children = available_moves(root.data)
    children.each do |child|
      node = Node.new(child)
      node.parent = root
      root.children << node
      build_tree(node, counter)
    end
  end

  def level_order
    return if @root.nil?

    queue = []
    array = []
    queue << @root
    until queue.empty?
      current = queue.first
      yield current if block_given?
      array << current.data
      current.children&.each { |child| queue << child }
      queue.shift
    end
    array
  end
end

game = Knight.new
game.knight_moves([3, 3], [4, 3])

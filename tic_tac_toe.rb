# frozen_string_literal: false

# Comment needed for rubocop
class Game
  attr_accessor :board

  def initialize
    # @board = {
    #   top_left: 1, top_middle: 2, top_right: 3,
    #   centre_left: 4, centre_middle: 5, centre_right: 6,
    #   bottom_left: 7, bottom_middle: 8, bottom_right: 9
    # }
    @board = {
      tl: 1, tm: 2, tr: 3,
      ml: 4, mm: 5, mr: 6,
      bl: 7, bm: 8, br: 9
    }
    # @board = {
    #   top: [1, 2, 3],
    #   middle: [4, 5, 6],
    #   bottom: [7, 8, 9]
    # }
  end

  def display_board
    # Did this way because 'Assignment Branch Condition size is too high'
    puts first_line
    puts divider_line
    puts second_line
    puts divider_line
    puts third_line
  end

  def put_piece(position, piece)
    @board[position] = piece
  end

  private

  def first_line
    " #{board[:tl]} | #{board[:tm]} | #{board[:tr]}"
  end

  def second_line
    " #{board[:ml]} | #{board[:mm]} | #{board[:mr]}"
  end

  def third_line
    " #{board[:bl]} | #{board[:bm]} | #{board[:bl]}"
  end

  def divider_line
    '-----------'
  end
end

# Rubocop comment
class PlayPiece
  def initialize
    @piece = ' '
  end
end

# Rubocop comment
class CrossPiece < PlayPiece
  def super
    @piece = 'X'
  end
end

# Rubocop comment
class CirclePiece < PlayPiece
  def super
    @piece = 'O'
  end
end

game = Game.new
game.display_board
# first player puts piece
# game.display_board
# second player puts piece

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
      top: [1, 2, 3],
      middle: [4, 5, 6],
      bottom: [7, 8, 9]
    }
  end

  def display_board
    p @board[:top]
    p @board[:middle]
    p @board[:bottom]
    # modify this more. X | O | ..etc
  end
end

class PlayPiece
end

class CrossPiece < PlayPiece
end

class CirclePiece < PlayPiece
end

game = Game.new
game.display_board
# first player puts piece
# game.display_board
# second player puts piece

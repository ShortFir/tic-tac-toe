# frozen_string_literal: true

# Comment needed for rubocop
class GameBoard
  attr_reader :board

  def initialize
    # @board = {
    #   top_left: 1, top_middle: 2, top_right: 3,
    #   centre_left: 4, centre_middle: 5, centre_right: 6,
    #   bottom_left: 7, bottom_middle: 8, bottom_right: 9
    # }
    @board = {
      tl: '1', tm: '2', tr: '3',
      ml: '4', mm: '5', mr: '6',
      bl: '7', bm: '8', br: '9'
    }
    # @board = {
    #   top: [1, 2, 3],
    #   middle: [4, 5, 6],
    #   bottom: [7, 8, 9]
    # }
  end

  def display
    # Did this way because 'Assignment Branch Condition size is too high'
    print first_line
    print divider_line
    print second_line
    print divider_line
    print third_line
  end

  def put_piece(position, piece)
    @board[position] = piece
  end

  private

  def first_line
    "\n #{board[:tl]} | #{board[:tm]} | #{board[:tr]}"
  end

  def second_line
    "\n #{board[:ml]} | #{board[:mm]} | #{board[:mr]}"
  end

  def third_line
    "\n #{board[:bl]} | #{board[:bm]} | #{board[:br]}"
  end

  def divider_line
    "\n-----------"
  end
end

# Not enough known about inheritance yet
class PlayPiece
  # attr_reader :piece
  # PIECE = ' '
  # def initialize
  #   @piece = ' '
  # end
end

# Probably don't need a whole class for one character
class Cross
  attr_reader :piece

  def initialize
    @piece = 'X'
  end
end

# Probably don't need a whole class for one character
class Circle
  attr_reader :piece

  def initialize
    @piece = 'O'
  end
end

# Main game loop
class Play
  def initialize
    @game = GameBoard.new
    @positions = @game.board.keys
    # @player = 'X'
  end

  def game
    player = 'X'
    while TRUE
      @game.display
      pos = get_player_input(player)
      @game.put_piece(@positions[pos - 1], player)
      player = switch_player(player)
    end
    # add 'position filled' method, to gameboard probably.
  end

  private

  def switch_player(xoro)
    xoro == 'X' ? 'O' : 'X'
  end

  def get_player_input(xoro)
    print "\n\nPlayer #{xoro}, enter position: "
    gets.chomp.to_i
  end
end

Play.new.game

# frozen_string_literal: true

# Comment needed for rubocop
class GameBoard
  attr_reader :board

  def initialize
    # Values are Interger, instead of String, for a check later on.
    @board = {
      tl: 1, tm: 2, tr: 3,
      ml: 4, mm: 5, mr: 6,
      bl: 7, bm: 8, br: 9
    }
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
    if @board[position].is_a?(Integer)
      @board[position] = piece
      TRUE
    else
      print "\nPosition already taken."
      FALSE
    end
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

# Main game loop
class Play
  def initialize
    @game = GameBoard.new
    @positions = @game.board.keys
  end

  def game
    player = 'X'
    while TRUE
      @game.display
      loop do
        # Player input here pauses the loop.
        pos = get_player_input(player)
        break if @game.put_piece(@positions[pos - 1], player)
      end
      player = switch_player(player)
    end
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

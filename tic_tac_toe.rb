# frozen_string_literal: true

# Object represents the actual game board, as named.
class GameBoard
  attr_reader :board

  def initialize
    # Values are Interger, instead of String, for a check later on.
    @board = {
      tl: 1, tm: 2, tr: 3,
      ml: 4, mm: 5, mr: 6,
      bl: 7, bm: 8, br: 9
    }
    # Maybe an array would make more sense?
    # Also an array of winning combinations? instead of that big if statement.
  end

  def display
    # Did this way because 'Assignment Branch Condition size is too high'
    print first_line
    print divider_line
    print second_line
    print divider_line
    print third_line
  end

  def put_piece?(position, piece)
    if @board[position].is_a?(Integer)
      @board[position] = piece
      TRUE
    else
      print "\nPosition already taken."
      FALSE
    end
  end

  def winner?(player)
    if three_in_a_row?
      print "\n\n#{player} Wins!!!"
      game_over
    elsif board_full?
      print "\n\nIt's a draw! Everybody loses..."
      game_over
    else
      FALSE
    end
  end

  private

  # This could be redone, but it works now, so...
  def three_in_a_row?
    if  [@board[:tl], @board[:tm], @board[:tr]].all?(@board[:tl]) ||
        [@board[:ml], @board[:mm], @board[:mr]].all?(@board[:ml]) ||
        [@board[:bl], @board[:bm], @board[:br]].all?(@board[:bl]) ||
        [@board[:tl], @board[:ml], @board[:bl]].all?(@board[:tl]) ||
        [@board[:tm], @board[:mm], @board[:bm]].all?(@board[:tm]) ||
        [@board[:tr], @board[:mr], @board[:br]].all?(@board[:tr]) ||
        [@board[:tl], @board[:mm], @board[:br]].all?(@board[:tl]) ||
        [@board[:bl], @board[:mm], @board[:tr]].all?(@board[:bl])
      TRUE
    else
      FALSE
    end
  end

  def board_full?
    @board.values.all?(String) ? TRUE : FALSE
  end

  def game_over
    print "\n\nPress Enter."
    gets
    TRUE
  end

  def first_line
    "\n #{@board[:tl]} | #{board[:tm]} | #{board[:tr]}"
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

# Main game loop. Object represents the overall game, i.e the 2 players.
# Or may be a collection of methods...so a module. Learn later I guess.
class Play
  def initialize
    @game = GameBoard.new
    @positions = @game.board.keys
    @player = 'X'
  end

  def game
    @game.display
    loop do
      loop do
        # Player input here pauses the loop.
        index = get_player_input(@player)
        break if @game.put_piece?(@positions[index - 1], @player)
      end
      @game.display
      break if @game.winner?(@player)

      @player = switch_player(@player)
    end
  end

  private

  def switch_player(xoro)
    xoro == 'X' ? 'O' : 'X'
  end

  def get_player_input(xoro)
    loop do
      print "\n\nPlayer #{xoro}, enter position (1-9): "
      input = gets.chomp.to_i
      return input if input.between?(1, 9)

      print "\nError! Number must be from 1 to 9."
    end
  end
end

Play.new.game

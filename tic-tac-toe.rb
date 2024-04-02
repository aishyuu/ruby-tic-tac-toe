class Board
  def initialize
    @board = ["/", "/", "/", "/", "/", "/", "/", "/", "/"]
  end

  def printBoard
    puts "   |   |   "
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "   |   |   "
    puts "-----------"
    puts "   |   |   "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "   |   |   "
    puts "-----------"
    puts "   |   |   "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "   |   |   "
  end

  def play(pos, sign)
    @board[pos] = sign
  end

  def reset
    @board = ["/","/","/","/","/","/","/","/","/"]
  end

  def winner?(sign)
    if(@board[0] == sign && @board[1] == sign && @board[2] == sign) ||
      (@board[3] == sign && @board[4] == sign && @board[5] == sign) ||
      (@board[6] == sign && @board[7] == sign && @board[8] == sign) ||
      (@board[0] == sign && @board[4] == sign && @board[8] == sign) ||
      (@board[1] == sign && @board[4] == sign && @board[7] == sign) ||
      (@board[2] == sign && @board[4] == sign && @board[6] == sign) ||
      (@board[0] == sign && @board[3] == sign && @board[6] == sign) ||
      (@board[2] == sign && @board[5] == sign && @board[8] == sign)
      return true
    end
    return false
  end

  def draw?
    !@board.include?("/")
  end
end

test = Board.new
test.play(0, "X")
test.play(4, "X")
test.play(5, "X")
test.play(6, "X")
test.play(2, "O")
test.play(3, "O")
test.play(8, "O")
test.play(7, "O")
test.play(1, "X")
puts test.draw?

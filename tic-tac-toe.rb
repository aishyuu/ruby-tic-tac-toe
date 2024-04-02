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

class Player
  attr_reader :sign

  def initialize(sign)
    @sign = sign
  end
end

def gameLoop
  board = Board.new
  player1 = Player.new("X")
  player2 = Player.new("O")

  board.printBoard

  while true do
    pos = gets.chomp.to_i
    board.play(pos, player1.sign)
    if board.draw?
      break
    end
    if board.winner?(player1.sign)
      break
    end
    board.printBoard

    pos = gets.chomp.to_i
    board.play(pos, player2.sign)
    if board.draw?
      break
    end
    if board.winner?(player2.sign)
      break
    end
    board.printBoard
  end

  board.printBoard
end

gameLoop

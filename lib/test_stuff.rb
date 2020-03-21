board = [" ", " ", " ", "X", " ", "O", " ", " ", "X"]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] != 0
    false
  else board[index] == " " || board[index] == ""
    false
  end
end

puts position_taken?(board, 5)

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    true
  elsif index.between?(0,8) && position_taken?(board, index) == true
    false
  else index.between?(0,8) != 0
    false
  end
end

puts valid_move?(board, 9)
puts valid_move?(board, 8)
puts valid_move?(board, 7)

def move(board, index, token = "X")
  board[index] = "#{token}"
end

 move(board, 2, "O")
 puts display_board(board)

def turn(board)
  # ask for input
  puts "Please enter 1-9:"
  #get input
  #convert input to index
  input = gets.strip
  index = "#{input}".to_i - 1
  #if index is valid
    #make the move for index
    #show the board
  if valid_move?(board, index) == true
      move(board, index, token = "X")
      display_board(board)
    #else
      # ask for input again until you get a valid input
  else while valid_move?(board, index) != true
      puts "Please enter a valid input between 1-9:"
      input = gets.strip
      index = "#{input}".to_i - 1
    end
    move(board, index, token = "X")
    display_board(board)
    end
end

turn(board)

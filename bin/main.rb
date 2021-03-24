#!/usr/bin/env ruby

require_relative '../lib/gameLogic'

puts 'enter player one name?'
player1 = Player.new('X')
player1.name = gets.chomp

puts 'enter player two name?'
player2 = Player.new('O')
player2.name = gets.chomp

board = Board.new

system 'clear'
system 'cls'

puts board.create_board

puts "#{player1.name} will be X"

puts "#{player2.name} will be O"

puts player1.letter.to_s

sleep 1

while board.game
  system 'clear'
  system 'cls'
  until board.valid
    puts board.create_board
    puts "It's #{player1.name} turn"
    puts ''
    input = gets.chomp.to_i
    board.check_valid_move(input)
  end
  board.square[input - 1] = player1.letter
  system 'cls'
  system 'clear'
  puts board.create_board
  if board.draw
    puts "It's a draw!"
    break
  end
  if board.win(player1)
    puts "#{player1.name} is the WINNER"
    break
  end
  system 'clear'
  system 'cls'
  board.valid = false
  until board.valid
    puts board.create_board
    puts "It's #{player2.name} turn"
    puts ''
    input = gets.chomp.to_i
    board.check_valid_move(input)
  end
  board.square[input - 1] = player2.letter
  system 'cls'
  system 'clear'
  puts board.create_board
  if board.win(player2)
    puts "#{player2.name} is the WINNER"
    break
  end
  board.valid = false
  system 'clear'
  system 'cls'
  puts board.create_board
  puts board.square
end

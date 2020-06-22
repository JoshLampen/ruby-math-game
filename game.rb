require './player'
require './question'

class Game
  attr_accessor :turn

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @turn = @player1.name
  end

  def start
    while @player1.alive? && @player2.alive?
      puts "----- NEW TURN -----"
    
      @turn == @player1.name ? Question.new.ask(@player1) : Question.new.ask(@player2)
    
      puts "#{@player1.name}: #{@player1.lives} lives remaining vs. #{@player2.name}: #{@player2.lives} lives remaining"
    
      @turn == @player1.name ? @turn = @player2.name : @turn = @player1.name
    end
    
    puts @player1.lives > 0 ? "#{@player1.name} wins with #{@player1.lives} lives remaning!" : "#{@player2.name} wins with #{@player2.lives} lives remaining!"
    puts "----- GAME OVER -----"
  end
end
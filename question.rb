require './player'

class Question
  attr_accessor :number1, :number2

  def initialize
    @number1 = Random.rand(1...20)
    @number2 = Random.rand(1...20)
  end

  def ask(player)
    puts "#{player.name}: What is #{@number1} + #{@number2}?"

    if gets.chomp.to_i == @number1 + @number2
      puts "#{player.name}: YES! You are correct."
    else
      puts "#{player.name}: Incorrect! You have lost a life."
      player.remove_life
    end
  end
end
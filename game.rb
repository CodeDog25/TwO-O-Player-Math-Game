require './player'
require './question'

class Game
  def initialize
    # Ask for player names and create player objects
    puts "Enter Player 1's name: "
    @player1 = Player.new(gets.chomp)
    puts "Enter Player 2's name: "
    @player2 = Player.new(gets.chomp)
    # Set the starting player to player 1
    @playerturn = @player1
  end

  def start_game
    puts "Let's start!"
    while @playerturn.lives > 0 do
      # Generate a new question and ask the current player
      question = Question.new
      puts "#{question.question} #{@playerturn.name}"
      answer = gets.chomp.to_i

      # Check if the answer is correct and update player lives accordingly
      if question.answer == answer
        puts "Correct!"
      else
        @playerturn.lose_life
        puts "Incorrect! You lose a life."
      end

      # Print the current score
      puts "#{@player1.name}: #{@player1.lives}/3 Vs #{@player2.name}: #{@player2.lives}/3"
      
      # Check if the current player is out of lives and end the game if so
      if @playerturn.lives == 0
        puts "#{@playerturn.name} is out of lives!"
        puts "----- GAME OVER -----"
        return
      end
      swap_player_turn
      puts "----- NEW TURN -----"
    end
  end

  def swap_player_turn
    # Switch to the other player for the next turn
    if @playerturn == @player1
      @playerturn = @player2
    else
       @playerturn = @player1
    end 
  end
end

  

  
require './players'
require './questions'

class Game
  def initialize
    @player1 = Player.new(gets.chomp)
    @player2 = Player.new(gets.chomp)
    @playerturn = @player1
  end

  def start_game
    while @playerturn.lives > 0 do
      question = Question.new
      puts "#{question.ask_question} #{@playerturn.name}"
      answer = gets.chomp
      if question.check_answer(answer)
        puts "Correct!"
      else
        @playerturn.lose_life
        puts "Incorrect! You lose a life."
      end
      puts "P1: #{@player1} VS P2: #{@player2}"
      if @player1.lives == 0 || @player2.lives == 0
        winner = @player1.lives > 0 ? @player1 : @player2
        loser = @player1.lives > 0 ? @player2 : @player1
        puts "#{loser.name} is out of lives :("
        puts "#{winner.name} wins with a score of #{winner.lives}/3!"
        puts "----- GAME OVER -----"
        return
      end
      swap_player_turn
      puts "----- NEW TURN -----"
    end
  end

  
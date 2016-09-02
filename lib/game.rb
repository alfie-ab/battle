require_relative 'player'

class Game
  attr_reader :player1, :player2, :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = player1
  end

  def attack
    return_opponent.reduce_hp_by(10)
  end

  def switch_players
    turn == player1 ? @turn = player2 : @turn = player1
  end

  def return_opponent
    turn == player1 ? player2 : player1
  end

  def continue?
    @player1.hp == 0|| @player2.hp == 0
  end
end

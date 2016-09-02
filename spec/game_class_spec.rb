require 'spec_helper'
require 'game'

describe Game do

  let(:player1) { double :player, reduce_hp_by: 90 }
  let(:player2) { double :player2, reduce_hp_by: 90 }
  subject(:game) {Game.new(player1, player2)}

  it 'should respond to the method reduce_hp_by' do
    game.attack
    expect(player2).to have_received(:reduce_hp_by)
  end

  it 'should start with player 1s turn' do
    expect(game.turn).to eq player1
  end

  it 'should switch whose turn it is' do
    game.switch_players
    expect(game.turn).to eq player2
  end

  it 'should switch whose turn it is' do
    game.switch_players
    game.switch_players
    expect(game.turn).to eq player1
  end

end

require 'spec_helper'
require 'game'

describe Game do
  let(:player_class) {double :player_class, new: player1}
  let(:player_class2) {double :player_class, new: player2}
  let(:player1) { double :player1, reduce_hp_by: 0 }
  let(:player2) { double :player2, reduce_hp_by: 90 }
  subject(:game) {described_class.new(player_class.new, player_class2.new)}

  it 'should respond to the method reduce_hp_by' do
    game.attack
    expect(player2).to have_received(:reduce_hp_by)
  end

  it 'should respond to the method reduce_hp_by' do
    game.attack
    game.switch_players
    game.attack
    expect(player1).to have_received(:reduce_hp_by)
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

  it 'should return true if the game should continue' do
    expect(game.continue?).to eq true
  end

  it 'should return false if the game should stop' do
    game.attack
    expect(game.continue?).to eq false
  end

end

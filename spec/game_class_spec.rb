require 'spec_helper'
require 'game'

describe Game do

  let(:player) { double :player, reduce_hp_by: 90 }
  subject(:game) {Game.new(player, player)}

  it 'should respond to the method reduce_hp_by' do
    game.attack(player)
    expect(player).to have_received(:reduce_hp_by)
  end

end

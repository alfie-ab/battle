require 'spec_helper'
require 'player'

describe Player do

  subject(:player) {Player.new("Alfie")}

  it 'should return its name' do
    expect(subject.name).to eq "Alfie"
  end

  it 'should reduce hp by 10' do
    subject.reduce_hp_by(10)
    expect(subject.hp).to eq 90
  end

end

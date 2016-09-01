require 'spec_helper'
require 'player'

describe Player do

  subject(:player) {Player.new("Alfie")}

  it 'should return its name' do
    expect(subject.name).to eq "Alfie"
  end

end

require 'spec_helper'
require_relative '../../app'

feature 'game_over' do
  scenario 'player2 should lose after reaching 0HP' do
    sign_in_and_play
    19.times {attack_and_switch}
    expect(page).to have_content("Tam has lost!")
  end
end

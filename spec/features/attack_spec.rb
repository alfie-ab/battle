require 'spec_helper'
require_relative '../../app'

feature 'attacks oponent' do
  # scenario 'player 1 attacks player 2' do
  #   sign_in_and_play
  #   expect(@player_two_hp).to change
  #   expect{@player_two_hp}.to change{Counter.count}.by(2)
  # end

  scenario 'player 1 gets confirmation after attacking player 2' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content("James attacks Tam!")
  end

  scenario 'when player 1 attacks player 2, player 2s hp is -= 10' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content("Tam's hp is now 90!")
  end
end

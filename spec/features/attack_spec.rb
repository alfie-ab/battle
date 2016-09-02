require 'spec_helper'
require_relative '../../app'


feature 'attacks oponent' do

  scenario 'player 1 gets confirmation after attacking player 2' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content("James attacks Tam!")
  end

  scenario 'player 2 gets confirmation after attacking player 1' do
    sign_in_and_play
    click_button "Attack"
    click_button "Switch players"
    click_button "Attack"
    expect(page).to have_content("Tam attacks James!")
  end

  scenario 'when player 1 attacks player 2, player 2s hp decreases by 10' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content("Tam's hp is now 90!")
  end

  scenario 'player 1 switches with player 2' do
    sign_in_and_play
    click_button "Attack"
    click_button "Switch players"
    expect(page).to have_content("It is now Tam's turn!")
  end

end

require 'spec_helper'
require_relative '../../app'

feature 'displays hitpoints' do

  scenario 'should be able to view both player1 and player2 hit points' do
    sign_in_and_play
    expect(page).to have_content("James has 100 HP")
  end

  scenario 'should be able to view both player1 and player2 hit points' do
    sign_in_and_play
    expect(page).to have_content("Tam has 100 HP")
  end

  scenario 'player1 hp should decrease by 10 after attack from player2' do
    sign_in_and_play
    click_button "Attack"
    click_button "Switch players"
    click_button "Attack"
    click_button "Switch players"
    expect(page).to have_content("James has 90 HP")
  end

  scenario 'player2 should lose after reaching 0HP' do
    sign_in_and_play
    19.times {attack_and_switch}
    expect(page).to have_content("Tam has lost!")
  end
end

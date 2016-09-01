require 'spec_helper'
require_relative '../../app'

feature 'attacks oponent' do
  # scenario 'player 1 attacks player 2' do
  #   sign_in_and_play
  #   expect(@player_two_hp).to change
  #   expect{@player_two_hp}.to change{Counter.count}.by(2)
  # end

  scenrio 'player 1 gets confirmation after attacking player 2' do
    sign_in_and_play
    expect(page).to have_content("#{@user_name_one} attacks #{@user_name_two}!")
  end
end

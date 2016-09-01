require 'spec_helper'
require_relative '../../app'

feature 'displays hitpoints' do
  scenario 'player 1 looks at HP of player 2' do
    sign_in_and_play
    expect(page).to have_content("Tam's Hit points: 100")
  end
end

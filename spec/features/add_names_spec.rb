require 'spec_helper'

feature 'add_names' do
  scenario 'player 1 enters name' do
      sign_in_and_play
    expect(page).to have_text("Welcome to the game where James plays Tam")
  end
end

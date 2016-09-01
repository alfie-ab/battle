def sign_in_and_play
  visit "/"
  fill_in('user_name_one', with: "James")
  fill_in('user_name_two', with: "Tam")
  click_button "Save player names"
end

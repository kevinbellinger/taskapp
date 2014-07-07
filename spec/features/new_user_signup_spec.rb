require 'rails_helper'

feature 'Create new user' do
  scenario 'Successfully' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Kevin Bellinger'
    fill_in 'Email', with: 'kevin@glider.io'
    fill_in 'Password', with: 'Password1234'
    fill_in 'Password confirmation', with: 'Password1234'
    click_button 'Sign up'
    expect( page ).to have_content('A message with a confirmation link has been sent to your email address.')
  end
end

feature 'Create new user - mismatched password' do
  scenario 'Successfully' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Kevin Bellinger'
    fill_in 'Email', with: 'kevin@glider.io'
    fill_in 'Password', with: 'Password123'
    fill_in 'Password confirmation', with: 'Password1234'
    click_button 'Sign up'
    expect( page ).to have_content("Password confirmation doesn't match Password Name")
  end
end


require 'rails_helper'

feature 'Sign-in with existing user name and password' do
  scenario 'Successfully' do
  visit new_user_session_path
  fill_in 'Email', with: 'admin@example.com'
  fill_in 'Password', with: 'helloworld'
  click_button 'Sign in'
  expect( page ).to have_content('Signed in successfully.')
  end
end
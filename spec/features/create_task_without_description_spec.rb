require 'rails_helper'

feature 'Fails to create task without Description' do
  scenario 'Successfully' do
    visit new_todo_path
    fill_in 'Description', with: ''
    click_button 'Save'
    expect( page ).to have_content('Your TODO was not saved')
  end
end

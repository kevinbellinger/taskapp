require 'rails_helper'

feature 'View all user TODO tasks'  do
  scenario 'Successfully' do
    visit todos_index_path
    expect( page ).to have_content('Meet up with the team')
  end
end
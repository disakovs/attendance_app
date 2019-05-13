require 'rails_helper'

feature 'User signs in' do
  background do
    User.create(username: 'teacher', password: 'password', role: 'admin')
  end
  
  scenario 'with existing username' do
    visit root_path
    fill_in "Username", with: 'teacher'
    fill_in "Password", with: 'password'
    click_button "Login"
    expect(page).to have_content "Log Out"
  end
end
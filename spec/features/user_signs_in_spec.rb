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

feature 'User interacts with the class' do
  background do
    User.create(username: 'teacher', password: 'password', role: 'admin')
  end
  
  scenario 'with existing username' do
    visit root_path
    fill_in "Username", with: 'teacher'
    fill_in "Password", with: 'password'
    click_button "Login"
    expect(page).to have_content "Log Out"
    
    click_link('Add a Class')
    expect(page).to have_content "Create a New Class"
    fill_in 'classroom_name', with: 'Gymnastics Level 4'
    fill_in 'classroom_age_limit', with: '10-12'
    select('gymnastics', from: 'classroom_classroom_type')
    click_button "Create New Class"
    
    expect(page).to have_content "You successfully added a class"
    
    click_link('go to classroom')
    fill_in 'student_first_name', with: 'FirstName'
    fill_in 'student_last_name', with: 'Lastname'
    click_button 'Add A New Student'
    
    expect(page).to have_content "Student Added to Class"
    expect(page).to have_content "FirstName Lastname"
    
    click_link 'Home'
    click_link('edit')
    
    expect(page).to have_content "Edit Classroom"
    
    fill_in 'classroom_age_limit', with: '6-12'
    click_button 'Update Class'
    
    expect(page).to have_content "6-12"
  end
end
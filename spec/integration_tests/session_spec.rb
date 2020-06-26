require_relative '../rails_helper.rb'

RSpec.describe 'Sessions controller', type: :feature do
  scenario 'create a new user using the signup page' do
    visit signup_path
    fill_in 'user[name]', with: 'Anne Richie'
    click_button 'Create User'
    expect(page).to have_content('User "Anne Richie" successfully Signed Up, login to write a review')
  end

  scenario 'when a user login' do
    User.create(name: 'Anne Richie')
    visit root_path
    click_link 'Login'
    fill_in 'name', with: 'Anne Richie'
    click_button 'Login'
    expect(page).to have_content('Welcome Anne Richie, you successfully logged in!')
  end

  scenario 'when a user log out' do
    User.create(name: 'Anne Richie')

    visit root_path
    click_link 'Login'
    fill_in 'name', with: 'Anne Richie'
    click_button 'Login'
    click_link 'Log Out'
    expect(page).to have_content('Logged out!')
  end
end

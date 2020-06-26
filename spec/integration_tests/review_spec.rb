require_relative '../rails_helper.rb'

RSpec.describe 'Review controller', type: :feature do
  before :each do
    User.create(name: 'Anne Richie')
    Category.create(name: 'Drama')

    visit root_path
    click_link 'Login'
    fill_in 'name', with: 'Anne Richie'
    click_button 'Login'
  end

  scenario 'create a new review with short title' do
    click_link 'Write a Review'
    sleep(5)
    fill_in 'review[title]', with: 'Neque'
    fill_in 'review[text]', with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'
    click_button 'Create Review'
    expect(page).to have_content('Title is too short (minimum is 15 characters)')
  end

  scenario 'create a new review with out title' do
    click_link 'Write a Review'
    sleep(5)
    fill_in 'review[text]', with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'
    click_button 'Create Review'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'create a new review without category' do
    click_link 'Write a Review'
    sleep(5)
    fill_in 'review[title]', with: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet'
    fill_in 'review[text]', with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'
    click_button 'Create Review'
    expect(page).to have_content('Review must have any category')
  end
end

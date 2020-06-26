require_relative '../rails_helper.rb'

RSpec.describe 'Category controller', type: :feature do
  before :each do
    User.create(name: 'Anne Richie')
    Category.create(name: 'Drama')

    visit root_path
    click_link 'Login'
    fill_in 'name', with: 'Anne Richie'
    click_button 'Login'
  end

  scenario 'trying to create a new category with a name already taken' do
    click_link 'Categories'
    click_link 'New Category'
    sleep(5)
    fill_in 'category[name]', with: 'Drama'
    fill_in 'category[priority]', with: '7'
    click_button 'Create Category'
    expect(page).to have_content('Name has already been taken')
  end

  scenario 'trying to create a new category with a name too short' do
    click_link 'Categories'
    click_link 'New Category'
    fill_in 'category[name]', with: 'Dra'
    click_button 'Create Category'
    expect(page).to have_content('Name is too short (minimum is 5 characters)')
  end

  scenario 'create a new user category' do
    click_link 'Categories'
    click_link 'New Category'

    fill_in 'category[name]', with: 'Mistery'
    fill_in 'category[priority]', with: '5'
    click_button 'Create Category'
    expect(page).to have_content('New category "Mistery" successfully created')
  end
end

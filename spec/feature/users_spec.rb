require 'rails_helper'

feature 'Users' do
  # create a new user
  scenario 'signing up' do
    visit(signup_path)
    expect(page).to_not have_link("Logout")

    fill_in 'Username', with: 'fakey'
    fill_in 'Email', with: 'fake@fake.fake'
    fill_in 'Password', with: 'fake'
    fill_in 'Password confirmation', with: 'fake'
    click_button 'Create User'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link("Logout")
  end

  # login
  feature 'with an existing user' do
    let!(:user) { User.create!(username: 'fakey', email: 'fake@fake.fake', password: 'fake') }

    scenario 'logging in' do
      visit(login_path)
      expect(page).to have_link("Login")

      fill_in 'Email', with: 'fake@fake.fake'
      fill_in 'Password', with: 'fake'
      click_button 'Login'

      expect(current_path).to eq(dashboard_path)
      expect(page).to_not have_link("Login")
    end
  end
end

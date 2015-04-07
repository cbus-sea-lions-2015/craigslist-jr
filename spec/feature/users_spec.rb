require 'rails_helper'

feature 'Users' do
  # create a new user
  scenario 'signs up' do
    # given I am on the signup page
    visit '/signup'
    # when I enter my user info
    within("#new_user") do
      fill_in "Email", with: "lucas@devbootcamp.com"
      fill_in "Username", with: "literallyblair"
      fill_in "Password", with: "omgserena"
      fill_in "Password confirmation", with: "omgserena"
    end
    # and submit the form
    click_button "Create User"
    # then I should "Welcome my username"
    expect(page).to have_content("Welcome literallyblair")
    # and I should see my account page
    expect(current_path).to eq("/dashboard")
  end

  feature 'has a user' do
    # login
    let!(:user) { User.create!(username: "Bruce", email: 'batman@batman.com', password: 'batman') }

    scenario 'logging in' do
      # Given I am on the home page
      visit('/login')
      # When I enter my username and password
      within('#login-form') do
        fill_in('Email', :with => 'batman@batman.com')
        fill_in('Password', :with => 'batman')
      end
      # And click login
      click_button('Login')

      # Then I expect to be logged in
      expect(page).to have_content('Welcome Bruce')
    end
  end
end

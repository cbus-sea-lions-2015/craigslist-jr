require 'rails_helper'

feature 'Users' do
  # create a new user
  # login
  

  # Given I am on the home page
  visit('/login')
  # When I enter my username and password 
  within('#login-form') do
    fill_in('Email', :with => 'batman@batman.com')
    fill_in('Password', :with => 'batman')
    click_button('Login')
  end
  # And click login

  # Then I expect to be logged in
  page.has_content?('Bruce')
end

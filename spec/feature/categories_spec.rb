require 'rails_helper'

given(:category) { Category.create(:name => "dogs")}

feature 'Browsing categories' do
 # given: that categories exist
 # when:  the user visits the categories page.
 # then:  A list of containing all the categories should display.

 scenario "should display a list with all existing categories" do 
  
  visit '/categories' 
  expect(page).to have_content(category.name)

 end


end
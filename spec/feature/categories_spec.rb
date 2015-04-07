require 'rails_helper'


feature 'Browsing categories' do
  # given: that categories exist
  let!(:category) { Category.create(:name => "dogs")}
  let!(:user) { User.create!(username: "author", password: "author", email:"fake@fake.fake") }
  let!(:article) { Article.create!(title: "Stuff", description: "This is stuff", price: 8, author: user, category: category) }

  # navigate categories
  scenario "should display a list with all existing categories" do
    # when:  the user visits the categories page.
    visit '/categories'
    # then:  A list of containing all the categories should display.
    expect(page).to have_link("dogs")
  end

  # show an article
  # GIVEN: A list of articles exists
  # WHEN: I click on an article link
  # THEN: I expect the browser to display the article's details

  it "shows an article" do
  	visit category_articles_path(category)
  	click_link('Stuff')
  	expect(page).to have_content("This is stuff")
  end
end

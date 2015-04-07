require 'rails_helper'

given(:CAT) { Category.create(:name => "dogs")}

feature 'Browsing categories' do
  # navigate categories
  # given: that categories exist
  # when:  the user visits the categories page.
  # then:  A list of containing all the categories should display.
  scenario "should display a list with all existing categories" do
    visit '/categories'
    expect(page).to have_content(category.name)
  end

  # show an article
  # GIVEN: A list of articles exists
  # WHEN: I click on an article link
  # THEN: I expect the browser to display the article's details

  it "shows an article" do
  	c = Category.make(name: "Shenanigans")
  	au = Author.make(username: "author", password: "author", email:"")
  	ar = Article.make(title: "Stuff", description: "This is stuff", price: 8, author: au, category: c)
  	visit category_path(c)
  	click_link('Stuff')
  	expect(page).to have_content("This is stuff.")
  end
end

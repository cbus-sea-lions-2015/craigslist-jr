require 'rails_helper'

feature 'Browsing categories' do
  # navigate categories
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

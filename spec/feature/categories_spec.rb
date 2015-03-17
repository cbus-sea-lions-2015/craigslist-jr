require 'rails_helper'

feature 'Browsing categories' do
  # given a category
  let!(:category) { Category.create!(name: 'bikes') }
  # and an article in that category
  let!(:user) { User.create(username: 'fakey', email: 'fake@fake.fake', password: 'fake') }
  let!(:article) { category.articles.create!(author: user, title: 'bike4sale', description: 'buy my bike you friend') }

  # navigate categories
  scenario 'clicking a category link' do
    # when a user clicks the category link
    visit(categories_path)
    click_link('bikes')
    # then I should see the category's page
    expect(current_path).to eq(category_articles_path(category))
    # with the article title on it
    expect(page).to have_content('bike4sale')
  end

  # show an article
  scenario 'viewing an article' do
    # when i click on an article
    visit(category_articles_path(category))
    click_link('bike4sale')
    # the article's information will appear
    expect(current_path).to eq(category_article_path(category, article))
    expect(page).to have_content('bike4sale')
    expect(page).to have_content('buy my bike you friend')
  end
end

require 'rails_helper'

RSpec.feature "Deleting an Article" do
  before do
    @article = Article.create(title: "Minim enim duis est ex sunt do sit Lorem duis.", body: "Body of Article one")
  end

  scenario "A user deletes an article" do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end

end
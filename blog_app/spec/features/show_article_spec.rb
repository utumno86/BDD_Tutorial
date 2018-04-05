require "rails_helper"

RSpec.feature "Showing an Articles" do
  before do
    @article = Article.create(title: 'Voluptate incididunt nostrud ut fugiat aliquip.', body: 'Veniam nulla culpa officia ea tempor nostrud sit eiusmod.')
  end

  scenario "A user shows an article" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
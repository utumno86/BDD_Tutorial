require "rails_helper"

RSpec.feature "Showing an Articles" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @article = Article.create(title: 'Voluptate incididunt nostrud ut fugiat aliquip.', body: 'Veniam nulla culpa officia ea tempor nostrud sit eiusmod.', user: @john)
  end

  scenario "if a user is not signed in, hide the edit and delete buttons" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")

  end

  scenario "if a user is not the articles owners, hide the edit and delete buttons" do
    visit "/"
    login_as(@fred)
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")

  end

  scenario "A signed in owner sees  an article" do
    visit "/"
    login_as(@john)
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end
end

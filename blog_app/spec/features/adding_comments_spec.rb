require "rails_helper"

RSpec.feature "Adding Comments To Users" do

  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @article = Article.create(title: 'Voluptate incididunt nostrud ut fugiat aliquip.', body: 'Veniam nulla culpa officia ea tempor nostrud sit eiusmod.', user: @john)
  end

  scenario "permits a signed in user to add a comment" do
    login_as(@fred)
    visit "/"

    click_link @article.title

    fill_in "New Comment", with: "An amazing article"
    click_button "Add Comment"

    expect(page).to have_content("Comment has been created")
    expect(page).to have_content("An amazing article")
    expect(page.current_path).to eq(article_path(@article))
  end
end
require "rails_helper"

RSpec.feature "Editing Articles" do
  before do
    @article1 = Article.create(title: "The first article", body: "Adipisicing excepteur ullamco aliqua ut cupidatat anim do quis ullamco nisi.")
  end

  scenario "A user updates an article" do
    visit "/"

    click_link @article1.title
    click_link "Edit Article"

    fill_in "Title",	with: "Ex adipisicing eu do tempor tempor culpa laboris irure amet mollit culpa velit."
    fill_in "Body",	with: "Excepteur voluptate tempor voluptate cillum occaecat commodo velit."
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article1))
  end

  scenario "A user updates an article" do
    visit "/"

    click_link @article1.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Excepteur voluptate tempor voluptate cillum occaecat commodo velit."
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article1))
  end
end
require "rails_helper"

RSpec.feature "Listing Articles" do
  before do
    @article1 = Article.create(title: "The first article", body: "Adipisicing excepteur ullamco aliqua ut cupidatat anim do quis ullamco nisi.")
    @article2 = Article.create(title: "The second article", body: "Id pariatur Lorem mollit nostrud non occaecat enim magna excepteur duis pariatur laboris.")
  end

  scenario "A user lists all articles" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end

end
require "rails_helper"

RSpec.feature "Listing Articles" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @article1 = Article.create(title: "The first article", body: "Adipisicing excepteur ullamco aliqua ut cupidatat anim do quis ullamco nisi.", user: @john)
    @article2 = Article.create(title: "The second article", body: "Id pariatur Lorem mollit nostrud non occaecat enim magna excepteur duis pariatur laboris.", user: @john)
  end

  scenario "with articles created and user not signed in" do
    visit "/"

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
    expect(page).not_to have_link("New Article")
  end

  scenario "with articles created and user signed in" do
    visit "/"
    login_as(@john)

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end

  scenario "A user has no articles" do
    Article.delete_all

    visit "/"

    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)

    within ("h1#no-articles") do
      expect(page).to have_content("No Articles Created")
    end
  end

end

require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  scenario "Can submit comments and view them" do
    user = User.create({email: "test@mail.com", password: "password"})
    Post.create(message: "Test Post", user_id: user.id)

    visit posts_url(as: user)
    click_on "Comment"
    fill_in "Message", with: "Test Comment"
    click_button "Submit"
    expect(page).to have_content("Test Comment")
  end
end

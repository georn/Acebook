require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  scenario "Can submit comments and view them" do
    Post.create(message: "Test Post")
    visit "/posts"
    click_link "Test Post"
    fill_in "Message", with: "Test Comment"
    click_button "Submit"
    expect(page).to have_content("Test Comment")
  end
end

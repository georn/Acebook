require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    User.create({email: "test@mail.com", password: "password"})

    visit '/sign_in'
    fill_in "Email", with: "test@mail.com"
    fill_in "Password", with: "password"
    click_button "Sign in"

    visit "/posts"
    click_link "Create a new post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end

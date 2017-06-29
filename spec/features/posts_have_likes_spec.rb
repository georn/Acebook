require 'rails_helper'

RSpec.feature 'Like', type: :feature do
  scenario "Can like a post and see that it is liked" do
    user = User.create({email: "test@mail.com", password: "password"})
    post = Post.create(message: "Test Post", user_id: user.id)
    visit posts_url(as: user)
    click_link "Test Post"
    click_button "Like"
    expect(page.find("#like_button").value).to match("Unlike")
  end
end

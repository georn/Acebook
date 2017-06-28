require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario "Posts show email" do
    user = User.create({email: "test@mail.com", password: "password"})
    post = Post.create(message: "Test Post", user_id: user.id)
    p user
    p post
    visit posts_url(as: user)
    expect('div#posts').to have_content("test@mail.com")
  end
end

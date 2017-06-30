require 'rails_helper'

RSpec.feature 'Post', type: :feature do

  scenario 'Can submit post and display the date' do
    user = User.create({email: "test@mail.com", password: "password"})
    Post.create(message: "Test Post", user_id: user.id)

    visit posts_url(as: user)
    date = Post.find_by(message: "Test Post").created_at
    expect(page).to have_content(date.to_formatted_s(:short))
  end

  scenario 'Post appear with newest post first' do
    user = User.create({email: "test@mail.com", password: "password"})
    Post.create(message: "Old Post", user_id: user.id)
    Post.create(message: "New Post", user_id: user.id)

    visit posts_url(as: user)
    expect(page.find('.post:first-child .post_body')).to have_content "New Post"
  end
end

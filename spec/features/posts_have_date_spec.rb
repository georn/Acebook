require 'rails_helper'

RSpec.feature 'Post', type: :feature do
  let(:comment) { create(:post, message: 'old post') }
  let(:new_comment) { create(:post, message: 'new post') }

  scenario 'Can submit post and display the date' do
    user = User.create({email: "test@mail.com", password: "password"})
    Post.create(message: "Test Post", user_id: user.id)
    visit "/posts"
    date = Post.find_by(message: "Test Post").created_at
    expect(page).to have_content(date.to_formatted_s(:short))
  end

  scenario 'Post appear with newest post first' do
    user = User.create({email: "test@mail.com", password: "password"})
    Post.create(message: "Old Post", user_id: user.id)
    Post.create(message: "New Post", user_id: user.id)


    visit "/posts"
    expect(page.find('#posts ul li:first-child')).to have_content "New Post"
  end
end

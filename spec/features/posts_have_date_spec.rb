require 'rails_helper'

RSpec.feature 'Post', type: :feature do
  let(:comment) { create(:post, message: 'old post') }
  let(:new_comment) { create(:post, message: 'new post') }

  scenario 'Can submit post and display the date' do
    Post.create(message: "Test Post")
    visit "/posts"
    date = Post.find_by(message: "Test Post").created_at
    expect(page).to have_content(date.to_formatted_s(:short))
  end

  scenario 'Post appear with newest post first' do
    Post.create(message: "Old Post")
    Post.create(message: "New Post")

    visit "/posts"
    expect(page.find('#posts ul li:first-child')).to have_content "New Post"
  end
end

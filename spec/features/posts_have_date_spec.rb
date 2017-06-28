require 'rails_helper'

RSpec.feature 'Post', type: :feature do
  scenario 'Can submit post and display the date' do
    Post.create(message: "Test Post")
    visit "/posts"
    date = Post.find_by(message: "Test Post").created_at
    expect(page).to have_content(date.to_formatted_s(:short))
  end
end

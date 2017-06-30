require 'rails_helper'

RSpec.feature "UserProfile", type: :feature do
  it "shows the user's email" do
    sign_in
    click_link "current_user_email"
    expect(page.find('#content')).to have_content("test@mail.com")
  end
end

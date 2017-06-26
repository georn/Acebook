require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "POST /" do


    it "creates a comment" do
      post :create, params: { post_id: 4, comment: { message: "Hello, world!"}}
      expect(Comment.find_by(message: "Hello, world!")).to be
    end
  end
end

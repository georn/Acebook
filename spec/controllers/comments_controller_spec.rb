require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { comment: { message: "Hello, world!" } }
      expect(response).to redirect_to(comments_url)
    end

    it "creates a post" do
      post :create, params: { comment: { message: "Hello, world!" } }
      expect(Comment.find_by(message: "Hello, world!")).to be
    end
  end
end

class PostsController < ApplicationController
  before_action :require_login, only: [:new]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end

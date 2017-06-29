class PostsController < ApplicationController
  before_action :require_login, only: [:new]

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @liked = liked?
    @findlike = find_likes
    @postlikescount = count_likes
  end

  private

  def count_likes
    @post.likes.count
  end

  def post_params
    params.require(:post).permit(:message)
  end

  def liked?
    !!@post.likes.find_by(user_id: current_user)
  end

  def find_likes
    @post.likes.find_by(user_id: current_user)
  end

end

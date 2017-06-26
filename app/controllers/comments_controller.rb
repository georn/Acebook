class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(1)
    p "Post name"
    p @post
    @comment =  @post.comments.create(comment_params)
    redirect_to comments_url
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end

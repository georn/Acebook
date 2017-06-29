class LikesController < ApplicationController
  def create
    post = Post.find(like_post_id)
    like = post.likes.create(user_id: current_user.id)
    redirect_to post
  end

  def destroy
    post = Post.find(like_post_id)
    post.likes.find_by(user_id: current_user).destroy
    redirect_to post
  end

  private

  def like_post_id
    params.permit(:post_id)[:post_id]
  end

end

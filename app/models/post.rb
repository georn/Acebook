class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  def time_format
    created_at.to_formatted_s(:short)
  end

  def user_email
    User.find(user_id).email
  end

  def count_likes
    likes.count
  end

  def liked_by(current_user)
    likes.find_by(user_id: current_user)
    end

  def find_likes(current_user)
    likes.find_by(user_id: current_user)
  end

end

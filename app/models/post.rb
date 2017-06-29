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

end

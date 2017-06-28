class Post < ApplicationRecord
  has_many :comments
  belongs_to :user


  def time_format
    created_at.to_formatted_s(:short)
  end


end

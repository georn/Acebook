class Post < ApplicationRecord
  has_many :comments

  def time_format
    created_at.to_formatted_s(:short)
  end

end

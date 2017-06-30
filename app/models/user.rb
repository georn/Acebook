class User < ApplicationRecord
  include Clearance::User
  has_many :posts
  has_many :likes

  mount_uploader :picture, PictureUploader
end

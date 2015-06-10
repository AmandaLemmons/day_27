class Post < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader

  validates :title,
  presence: true,

end

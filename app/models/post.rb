class Post < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader

  validates :title,
  presence: true
  acts_as_taggable

  belongs_to :user

end

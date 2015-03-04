class Pin < ActiveRecord::Base
  
  mount_uploader :banner, BannerUploader
  acts_as_votable

  belongs_to :user
end

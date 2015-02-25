class Pin < ActiveRecord::Base
  
  mount_uploader :banner, BannerUploader

  belongs_to :user
end

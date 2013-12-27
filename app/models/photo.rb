class Photo < ActiveRecord::Base
  belongs_to :tout
  mount_uploader :image, PhotoUploader
end

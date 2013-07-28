class Tout < ActiveRecord::Base
  belongs_to :operation
  belongs_to :category
  belongs_to :city
  belongs_to :user

  validates_presence_of :name, :content#, :operation, :category, :city

  scope :available, ->{ where(deleted: false) }
end

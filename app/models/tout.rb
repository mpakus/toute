class Tout < ActiveRecord::Base
  belongs_to :operation
  belongs_to :category
  belongs_to :city
  belongs_to :user

  validates_presence_of :name, :content

  scope :available, ->{ where(deleted: false) }
end

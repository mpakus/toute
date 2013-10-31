class Tout < ActiveRecord::Base
  belongs_to :operation
  belongs_to :category
  belongs_to :city
  belongs_to :user

  validates_presence_of :name, :content, :operation, :category, :city

  scope :available, ->{ where(deleted: false) }
  scope :approved,  ->{ where(approved: true) }
  scope :upstair, ->{ order('id DESC') }
  scope :filtered, lambda{ |operation| where(operation_id: operation.id)}
  scope :textlike, lambda{ |texttofind| where(["content LIKE ?", "%#{texttofind}%"])}
end

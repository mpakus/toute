class Comment < ActiveRecord::Base
  belongs_to :tout
  belongs_to :user
  validates_presence_of :content, :user
end

class Comment < ActiveRecord::Base
  belongs_to :tout
  belongs_to :user
end

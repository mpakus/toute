class User < ActiveRecord::Base
  has_many :touts

  ##
  # Is current_user admin?
  def admin?
    role == 'admin'
  end
end

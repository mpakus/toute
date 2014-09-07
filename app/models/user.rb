class User < ActiveRecord::Base
  has_many :touts
  has_many :comments

  ##
  # is current_user admin?
  def admin?
    role == 'admin'
  end

  def name
    nick_name || first_name
  end
end

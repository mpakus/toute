class Operation < ActiveRecord::Base
  include ListValidation

  has_many :touts
end

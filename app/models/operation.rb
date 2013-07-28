class Operation < ActiveRecord::Base
  include ListValidation

  has_many :touts
  #accepts_nested_attributes_for :touts
end

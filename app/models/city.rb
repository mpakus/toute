class City < ActiveRecord::Base
  validates_presence_of :alias, :name
  validates :alias, length: { maximum:32, tokenizer:lambda{ |str| str.scan(/\w+/)} }, uniqueness: true
end

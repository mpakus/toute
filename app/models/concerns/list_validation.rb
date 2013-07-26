module ListValidation
  extend ActiveSupport::Concern
  included do
    validates_presence_of :alias, :name
    validates :alias, length: { maximum:32, tokenizer:lambda{ |str| str.scan(/\w+/)} }, uniqueness: true
  end
end
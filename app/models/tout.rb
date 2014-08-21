class Tout < ActiveRecord::Base
  belongs_to :operation
  belongs_to :category
  belongs_to :city
  belongs_to :user

  has_many :photos
  has_many :comments

  validates_presence_of :name, :content, :operation, :category, :city

  scope :available, ->{ where(deleted: false) }
  scope :approved,  ->{ where(approved: true) }
  scope :upstair,   ->{ order('id DESC') }
  scope :ordered,   ->{ order('id DESC') }
  #scope :filtered, lambda{ |operation| where(operation_id: operation.id) }
  scope :category,  lambda{ |category| where(category: Category.where(alias: category).first ) unless category.nil? }
  scope :city,      lambda{ |city| where(city: City.where(alias: city).first ) unless city.nil? }
  scope :operation, lambda{ |operation| where(operation: Operation.where(alias:operation).first) unless operation.nil? }
  scope :search,    lambda{ |string| where('content LIKE ? OR name LIKE ?', "%#{string}%", "%#{string}%") unless string.nil? }

  ##
  # Filter touts by given named parameters (works only in Ruby 2)
  def self.filter_by(operation: nil, city: nil, category: nil, string: nil)
    self.search(string).city(city).operation(operation).category(category).ordered
  end
end

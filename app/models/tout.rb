class Tout < ActiveRecord::Base
  belongs_to :operation
  belongs_to :category
  belongs_to :city
  belongs_to :user

  #validates_presence_of :name, :content, :operation, :category, :city

  scope :available, ->{ where(deleted: false) }
  scope :published, ->{ where(state: "опубликовано") }

  state_machine initial: :pending do
    state :pending, value: "pending"
    state :prepared, value: "подготовлено"
    state :published, value: "опубликовано"


    event :prepare do
      transition pending: :prepared
    end

    event :publish do
      transition prepared: :published
    end

    event :unpublish do
      transition published: :prepared
    end

  end


end

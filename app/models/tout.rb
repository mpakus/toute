class Tout < ActiveRecord::Base
  belongs_to :operation
  belongs_to :category
  belongs_to :city
  belongs_to :user

  #validates_presence_of :name, :content, :operation, :category, :city

  scope :available, ->{ where(deleted: false) }
  scope :pended,  ->{ with_state(:pending) }
  scope :prepared, ->{ with_state(:prepared) }
  scope :published, ->{ with_state(:published) }

  state_machine initial: :pending do
    # Авточерновик(пустышка)
    state :pending, value: "черновик"
    # Подготовленное для публикации
    state :prepared, value: "подготовлено"
    # Опубликованное объявление
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

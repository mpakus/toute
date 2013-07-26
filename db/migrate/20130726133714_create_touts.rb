class CreateTouts < ActiveRecord::Migration
  def change
    create_table :touts do |t|
      t.string :name
      t.text :content
      t.references :option, index: true
      t.references :category, index: true
      t.references :city, index: true
      t.references :user, index: true
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end

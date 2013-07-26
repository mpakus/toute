class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :alias, limit: 32
      t.string :name

      t.timestamps
    end
    add_index :categories, :alias
  end
end

class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :alias, limit: 32
      t.string :name

      t.timestamps
    end
    add_index :cities, :alias
  end
end

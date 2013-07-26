class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :alias, limit: 32
      t.string :name

      t.timestamps
    end
    add_index :operations, :alias
  end
end

class AddStateToTouts < ActiveRecord::Migration
  def change
    add_column :touts, :state, :string
    add_index :touts, :state
  end
end

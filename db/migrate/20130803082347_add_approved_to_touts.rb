class AddApprovedToTouts < ActiveRecord::Migration
  def change
    add_column :touts, :approved, :boolean, default:false
    add_index :touts, :approved
  end
end

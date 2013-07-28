class RenameOptionToOperation < ActiveRecord::Migration
  def change
    rename_column :touts, :option_id, :operation_id
  end
end

class RenameResourceOfPermissions < ActiveRecord::Migration
  def up
    rename_column :permissions, :resource_id, :resourceable_id
    rename_column :permissions, :resource_type, :resourceable_type
  end

  def down
    rename_column :permissions, :resourceable_id, :resource_id
    rename_column :permissions, :resourceable_type, :resource_type
  end
end

class AddParentIdToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :parent_id, :integer
  end
end

class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.boolean :behavior
      t.integer :role_id
      t.string :action_name
      t.string :prep
      t.string :module_name
      t.string :resource_type
      t.string :resource_id

      t.timestamps
    end
  end
end

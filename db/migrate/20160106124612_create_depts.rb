class CreateDepts < ActiveRecord::Migration
  def change
    create_table :depts do |t|
      t.string :name
      t.string :description
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end

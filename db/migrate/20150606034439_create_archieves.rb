class CreateArchieves < ActiveRecord::Migration
  def change
    create_table :archieves do |t|

      t.timestamps
    end
  end
end

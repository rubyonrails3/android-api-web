class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :url
      t.integer :remote_id
      t.string :device_id

      t.timestamps null: false
    end
  end
end

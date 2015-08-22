class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_id, unique: true, index: true
      t.string :token

      t.timestamps null: false
    end
  end
end

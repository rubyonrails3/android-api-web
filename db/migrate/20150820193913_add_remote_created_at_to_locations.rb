class AddRemoteCreatedAtToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :remote_created_at, :datetime
  end
end

class AddMissingIndex < ActiveRecord::Migration
  def change
    add_index :articles, :event_id
    add_index :articles, :user_id
    add_index :articles, :upload_id

    add_index :events, :location_id
  end
end

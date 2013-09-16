class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.decimal :latitude, :precision => 16, :scale => 12
      t.decimal :longitude, :precision => 16, :scale => 12

      t.timestamps
    end
  end
end

class CreateRolesTable < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end

class MoveUserFlagsToRoles < ActiveRecord::Migration
  def up
    remove_column :users, :admin
    remove_column :users, :editor
    remove_column :users, :author
    remove_column :users, :contributor
  end

  def down
    add_column :users, :admin, :boolean
    add_column :users, :editor, :boolean
    add_column :users, :author, :boolean
    add_column :users, :contributor, :boolean
  end
end

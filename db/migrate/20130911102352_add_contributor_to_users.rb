class AddContributorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contributor, :boolean
  end
end

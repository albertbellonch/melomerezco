class AddNameAndSurnamesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surnames, :string
  end
end

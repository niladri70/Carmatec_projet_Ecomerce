class AddRoleIdToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
    add_column :users, :role_id, :integer,:default => 2

  	end
end
end
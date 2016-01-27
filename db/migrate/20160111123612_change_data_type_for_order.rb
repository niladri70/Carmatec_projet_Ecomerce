class ChangeDataTypeForOrder < ActiveRecord::Migration
   def self.up
    change_column :orders, :product_id, :string
  end
 
  def self.down
    change_column :orders, :product_id, :integer
  end
end

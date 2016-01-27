class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :user_id
    	t.text :product_id
    	t.string :status , :default=>"progress"
    	t.integer :address_id
    	t.integer :price

      t.timestamps null: false
    end
  end
end

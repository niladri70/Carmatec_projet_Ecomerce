class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.integer :product_id
    	t.integer :user_id
    	t.string  :status, :default => "progress"

      t.timestamps null: false
    end
  end
end

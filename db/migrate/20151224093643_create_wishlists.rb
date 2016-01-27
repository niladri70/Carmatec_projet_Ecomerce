class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
    	t.integer :product_id
    	t.integer :user_id
    	t.attachment :avatar


      t.timestamps null: false
    end
  end
end

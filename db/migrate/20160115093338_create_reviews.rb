class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.text :views_about_product
    	t.text :product_id
    	t.text :user_id    	
      t.timestamps null: false
    end
  end
end

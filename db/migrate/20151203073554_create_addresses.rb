class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.string :first_name ,null: false, default:""
      t.string :last_name  ,null: false   , default:""
    	t.string :address,null: false
    	t.string :city,null: false
    	t.string :postcode,null: false
    	t.string :country,null: false
      t.integer :product_id,null: false
      t.decimal :total_price
    	
    	t.string :address_type
    	t.integer :user_id 


      t.timestamps null: false
    end
  end
end

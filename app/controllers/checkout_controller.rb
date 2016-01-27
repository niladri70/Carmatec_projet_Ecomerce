class CheckoutController < ApplicationController
	def index
		@product = Product.last
	end

	#creating new address in Checkout Controller
	
	def Order_all
		@all_products = Cart.where(:user_id => current_user.id) 
	end
	
	def place_order
		@address = Address.create(user_params)
		if(@address.save)
			Order.create(:address_id => @address.id, :user_id => current_user.id, :product_id =>  params["address"]["product_id"].split(),:price => @address.total_price)
		    Cart.delete_all(:user_id => current_user.id )
		end
		redirect_to proceed_shops_path
	end
		private
		def user_params
			params.require(:address).permit(:first_name,:last_name,:user_id,:postcode,:country,:address,:city,:address_type,:product_id,:total_price)
		end

end

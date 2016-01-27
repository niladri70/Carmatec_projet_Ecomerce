class CartController < ApplicationController

  #delete products from cart
   def destroy
    @cart = Cart.find(params[:id])
    @cart.delete
      redirect_to cart_shops_path
   end
   
end

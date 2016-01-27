class ShopsController < ApplicationController

  #shops index page
  def index
    @products = Product.last(4)
  end

  #shops cart page
  def cart
    @products = Product.limit(2).order("RAND()")
    @product = Product.limit(4).order("RAND()")
  end

  #showing details of single product
  def single_product
    @product = Product.limit(3).order("RAND()")
    @pro = Product.find(params[:product_id])

  end

  #shops wishlist page
  def wishlist
    @wishes = current_user.wishlists

  end

  #destroy wishlist
  def destroy
    @wish = Wishlist.find(params[:id])
    @wish.delete
    redirect_to wishlist_shops_path

  end

  #showing details of the current order
  def proceed
    @current_order = current_user.orders.last
    @products = Product.where(id: @current_order.product_id.split(/[^\d]/).reject(&:empty?))
    
  end

  #shops product page
  def product
      @products = Product.paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @category = Category.find(params[:id])
  end

  #adding to cart
  def ajax_add
    if request.xhr?
      Cart.create(product_id: params[:product_id], user_id: current_user.id)
      respond_to do |format|
        format.html{}
        format.js { }
      end
    else
      # respond to normal request
    end
  end 

  #add to wish list
  def ajax_wish
   if request.xhr?
      Wishlist.create(product_id: params[:product_id], user_id: current_user.id)
      respond_to do |format|
        format.js { }
      end 
    else
      # respond to normal request
    end
  end


end
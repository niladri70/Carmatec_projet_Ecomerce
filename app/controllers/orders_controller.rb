class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
  end
	
  def create
    @order = Order.new(order_params)
    respond_to do |format|
    if @order.save
      session[:order_id] = @order.id
    else
      format.html { render action: 'new' }
    end
  end
  end

  private

  def order_params
    params.require(:order).permit(:price, :product_id,:user_id,:status)
  end

end

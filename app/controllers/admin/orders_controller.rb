class Admin::OrdersController < ApplicationController
	before_filter :authenticate_user!, :check_admin
	def index
		@addresses =Address.all
	end

	def new 
		@orders = Order.new
	end

	def create
		@orders = Order.create (orders_params)
		redirect_to new_admin_order_path
	end

	def edit
		@orders = Order.edit(params[:id])
	end

	def update
		@orders = Order.find(params[:id])
		@orders = Order.attributes(params[:id])
		redirect_to admin_orders_path
	end

	def destroy
		@orders = Order.delete(params[:id])
		redirect_to admin_orders_path
	end

	def show
		@orders = Order.find(params[:id])
	end

	private

	def orders_params
		params.require(:orders).permit(:user_id,:product_id)
	end
end

class Admin::DashboardController < ApplicationController
	before_filter :authenticate_user!, :check_admin
	
	def index
		
		@users= User.all
		@products =  Product.all
		@orders = Order.all
		@addresses = Address.all
		@carts = Cart.all
		@categories = Category.all
		@roles = Role.all
		
	end

	def new_user
		@user = User.new
	end

	def create_user
		@user = User.new
		@user = User.new(user_param)
		respond_to do |format|
			if @user.save
				format.html{redirect_to user_path , notice:'User was successfully created'}

			else
				format.html{redirect_to new_user_path}
			end

		end
	end

	def new_product
		@product = Product.new
	end

	def create_product
		@product = Product.new
		@product = Product.new(product_param)
		respond_to do |format|
			if @product.save
				format.html{redirect_to product_path , notice:'product was successfully created'}

			else
				format.html{redirect_to new_product_path}
			end

		end
	end

	def new_role
		@role=Role.new		
	end

	def create_role
		@role=Role.new
		@role=Role.new(role_param)
		respond_to do |format|
			if @role.save
				format.html{redirect_to role_path , notice:'role was successfully created'}

			else
				format.html{redirect_to new_role_path}
			end

		end
		
	end

	def new_category
		@category = Category.new		
	end

	def create_category
		@category = Category.new
		@category = Category.new(category_param)
	end
	
	def edit

	end

	def update

	end

	def show 

	end

	def destroy

	end
end

class Admin::ProductsController < ApplicationController
	before_filter :authenticate_user!, :check_admin
	def index
		@products = Product.paginate(:page => params[:page], :per_page => 8)
	end

	def new 
		@category = Category.all
		@product = Product.new
	end

	def create
		@product = Product.create(product_params)
		redirect_to admin_products_path
	end

	def edit
		@category = Category.all
		@product = Product.find(params[:id])
	end

	def update

		@product = Product.find(params[:id])
		respond_to do |f|
			
			if @product.update(product_params)
				f.html{redirect_to admin_products_path , notice: 'product was successfully updated'}

			else
				f.html{redirect_to edit_admin_product_path, notice: 'please update again'}
			end
		end
		
	end

	def destroy
		@product = Product.delete(params[:id])
		redirect_to admin_products_path
	end

	def show

		@product = Product.find(params[:id])
		@a =Review.where(:product_id => @product.id).pluck(:views_about_product,:user_id)

		# @review = Review.find_by_product_id(@product.id)
		# @reviews = @review.views_about_product
	end

	private

	def product_params
		params.require(:product).permit(:product_id,:name,:price,:category_id,:avatar)
	end	
end

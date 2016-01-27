class Admin::CategoriesController < ApplicationController

	before_filter :authenticate_user!, :check_admin
	def index
		@categories =Category.all
	end

	def new 
		@category = Category.new
	end

	def create
		@category = Category.create(categories_params)
		redirect_to admin_categories_path
	end
	def edit
		@category = Category.edit(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category = Category.attributes(params[:id])
		redirect_to admin_categories_path
	end

	def destroy
		@category = Category.delete(params[:id])
	end

	def show
		@category = Category.find(params[:id])
	end

	private

	def categories_params
		params.require(:category).permit(:name)
	end
end

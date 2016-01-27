class Admin::UsersController < ApplicationController

	before_filter :authenticate_user!, :check_admin
	def index
		@users = User.all 

	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.delete
		redirect_to admin_users_path
	end
end

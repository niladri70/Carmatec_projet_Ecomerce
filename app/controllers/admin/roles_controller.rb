class Admin::RolesController < ApplicationController
	before_filter :authenticate_user!, :check_admin
	def index
		@roles  =Role.all
	end

	def new 
		@role = Role.new
	end

	def create
		@role = Role.create(roles_params)
		redirect_to admin_roles_path
	end

	def edit
		@role = Role.find(params[:id])
	end

	def update
		@role = Role.find(params[:id])
		respond_to do |f|
			if @role.update(roles_params)
				f.html{redirect_to admin_roles_path , notice: 'role was successfully updated'}

			else
				f.html{redirect_to edit_admin_roles_path, notice: 'please update again'}
			end
		end
	end

	def destroy
			
		@role = Role.delete(params[:id])
		redirect_to admin_roles_path
	end

	private

	def roles_params
		params.require(:role).permit(:name)
	end
end



class UsersController < ApplicationController
	
	# showing user details 
	def show		
		@user = current_user
	end
end

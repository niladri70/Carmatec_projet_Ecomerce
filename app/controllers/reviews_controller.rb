class ReviewsController < ApplicationController

	def new
		@review = Review.new
	end

	def create
		@review = Review.create(review_params)
		if @review.save
			flash[:notice] = "You have successfully logged out."
			redirect_to :back			
		else
			
			 flash[:notice] = "couldn't save review,please enter once again"
			 redirect_to :back
		end

	end

	private
	def review_params
		params.require(:review).permit(:views_about_product,:product_id,:user_id)
	end
end

class Wishlist < ActiveRecord::Base
	has_many :products
	belongs_to :user
	has_attached_file :avatar
	has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  def destroy
      @wishes = Wishlist.delete(params[:id])
      redirect_to wishlist_shops_path
  end
end

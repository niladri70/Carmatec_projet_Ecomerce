class Product < ActiveRecord::Base
	 belongs_to :category
	 belongs_to :user
	 belongs_to :cart
	 has_many :orders
	 belongs_to :wishlist
	 has_attached_file :avatar
	 has_many :reviews
	 belongs_to :address
	 ratyrate_rateable "quality", "price"
	 has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end

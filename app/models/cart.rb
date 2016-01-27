class Cart < ActiveRecord::Base
	has_many :products 
	belongs_to :user
	belongs_to :order
	 has_attached_file :avatar
	 has_attached_file :avatar, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
   # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end

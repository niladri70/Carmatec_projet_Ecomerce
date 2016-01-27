class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many  :orders
  has_many :products
  has_many  :carts
  has_one :payment
  has_many :addresses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       
  belongs_to :role, :foreign_key => 'role_id'
  has_many :wishlists
  ratyrate_rater

  def full_name
    [first_name,last_name].join(" ")
  end
  
end

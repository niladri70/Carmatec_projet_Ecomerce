class Role < ActiveRecord::Base
	has_many :users
	validates :name, :presence => true
	validates_uniqueness_of :name, :case_sensitive => false
# has_many :us
end

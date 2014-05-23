class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :profile

	def self.search(query)
		where("title like ?", "%#{query}%")
	end
end

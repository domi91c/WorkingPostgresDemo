class Offer < ActiveRecord::Base
	belongs_to :user


	def self.search(query)
		where("title like ?", "%#{query}%")
	end

end

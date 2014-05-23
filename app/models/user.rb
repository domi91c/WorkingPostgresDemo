class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	validates :username, :uniqueness => {:case_sensitive => false}

	attr_accessor :signin

	has_many :posts
	has_one :offer

	has_one :request

	has_one :profile

	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		where(conditions).where(["lower(username) = :value OR lower(email)
   = :value", { :value => signin.downcase }]).first
	end

	def name
		"#{first_name} #{last_name}"
	end
end

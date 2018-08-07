class Customer < ApplicationRecord
	paginates_per 2

	validates :name, presence: true
	validates :address, presence: true
	validates :number, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }, length: { minimum: 10 }, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true 

	def self.search(search_customer_name, search_customer_username)
 		if search_customer_name or search_customer_username 
 			where('name LIKE ? and username LIKE ?', "%#{search_customer_name}%", "%#{search_customer_username}%").order(:name)
 		else
 			order(:name)
 		end
 	end

end

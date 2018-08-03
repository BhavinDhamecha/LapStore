class Customer < ApplicationRecord
	validates :name, presence: true
	validates :address, presence: true
	validates :number, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }, length: { minimum: 10 }, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true 

end

class User < ApplicationRecord
	validates :username, uniqueness: true, presence: true, length: {minimum: 3, maximum: 25}
	validates :email, uniqueness: true, presence: true, length: {maximum: 105}, format: { with: URI::MailTo::EMAIL_REGEXP } 

end
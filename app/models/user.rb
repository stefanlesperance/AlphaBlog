class User < ApplicationRecord
	#The self in the below line references the object in each email class.
	before_save {self.email = email.downcase}
	#dependent: :destroy -> Indicates that if a user is deleted, any associated dependents are destroyed as well.
	has_many :articles, dependent: :destroy

	validates :username, uniqueness: { case_sensitive: false}, 
				presence: true, 
				length: { minimum: 3, maximum: 25 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :email, uniqueness: { case_sensitive: false}, 
				presence: true, 
				length: { maximum: 105 }, 
				format: { with: VALID_EMAIL_REGEX } 

	has_secure_password


end
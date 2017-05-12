class User < ApplicationRecord
	
	has_secure_password

 	validates :email, presence: true, uniqueness: true, allow_blank: false,format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
 	validates :password, presence: true, confirmation: true, allow_blank: false
 	validates :full_name, presence: true, allow_blank: false 
 	validates :username, presence: true, allow_blank: false, uniqueness: true

 	has_many :requests_send, foreign_key: 'sender_id', class_name: 'Request'
	has_many :request_received, foreign_key: 'receiver_id', class_name: 'Request'
	has_many :topics, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :tourneys, dependent: :destroy

	has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "50x50#" }, :default_url => "/default/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end

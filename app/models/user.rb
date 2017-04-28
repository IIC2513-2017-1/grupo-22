class User < ApplicationRecord
  validates :email, presence: true, allow_blank: false,format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, confirmation: true, allow_blank: false

  has_many :requests_send, foreign_key: 'sender_id', class_name: 'Request'
  has_many :request_received, foreign_key: 'receiver_id', class_name: 'Request'
end

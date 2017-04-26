class User < ApplicationRecord
  validates :full_name :email :username, presence: true, allow_blank: false,format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, confirmation: true, allow_blank: false
end

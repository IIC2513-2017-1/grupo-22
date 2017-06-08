class Player < ApplicationRecord
  validates :full_name, presence: true, allow_blank: false
  validates :position, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  belongs_to :team
end

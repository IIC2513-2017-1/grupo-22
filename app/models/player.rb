class Player < ApplicationRecord
  validates :full_name, presence: true, allow_blank: false
  validates :position, presence: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :leg, inclusion: { in: %w(Izquierdo Derecho), message: "%{value} invalid format" }

  belongs_to :team

  has_attached_file :photo, :styles => { :medium => "200x200>", :thumb => "50x50#" }, :default_url => "/default/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end

class Tourney < ApplicationRecord
  validates :mail, presence: true, allow_blank: false,format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, presence: true, allow_blank: false
  validates :format, inclusion: { in: %w(Playoffs Torneo), message: "%{value} no es un formato válido" }
  validates :description, presence: true, allow_blank: false 
  validates :location, presence: true, allow_blank: false 
  validates :price, presence: true, allow_blank: false 
  validates :prize, presence: true, allow_blank: false 
  validates :phone, presence: true, allow_blank: false 
  validates :schedule, presence: true, allow_blank: false
  validate  :validate_end_date_before_start_date

  belongs_to :user
  has_and_belongs_to_many :teams
  has_many :requests
  has_many :matches

  def validate_end_date_before_start_date
    if end_date && start_date
      errors.add(:end_date, "Put error text here") if end_date < start_date
    end
  end

end

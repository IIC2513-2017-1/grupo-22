class Tourney < ApplicationRecord
  validates :mail, presence: true, allow_blank: false,format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, presence: true, allow_blank: false
  validates :format, inclusion: { in: %w(Playoffs Torneo), message: "%{value} invalid format" }
  validates :description, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
  validates :prize, presence: true, allow_blank: false
  validates :phone, presence: true, allow_blank: false
  validates :schedule, presence: true, allow_blank: false
  validate  :validate_end_date_before_start_date
  validate  :validate_ins_date_before_start_date

  belongs_to :user

  #has_and_belongs_to_many :teams,  uniqueness: true
  has_many :participants
  has_many :teams, through: :participants

  has_many :requests
  has_many :matches, dependent: :destroy
  has_one :foro, dependent: :destroy
  #has_one :ranking, dependent: :destroy

  def validate_end_date_before_start_date
    if end_date && start_date
      errors.add(:end_date, "invalid") if end_date < start_date
    end
  end

  def validate_ins_date_before_start_date
    if inscription_limit_date && start_date
      errors.add(:inscription_limit_date, "invalid") if  start_date < inscription_limit_date
    end
  end

  def set_brackets
    if format == 'Playoffs'
      brackets = Hash.new('no_match')
      matches.each do |m|
        if m.bracket_code.present?
          brackets[m.bracket_code] = m
        end
      end
      return brackets
    end
  end
end

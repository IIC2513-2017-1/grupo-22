class Topic < ApplicationRecord
	validates :title, presence: true
    validates :content, presence: true

	belongs_to :foro
	belongs_to :user
	has_many :comments

end

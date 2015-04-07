class Report < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates	:generation,	presence: true
	validates	:content, 		presence: true
end
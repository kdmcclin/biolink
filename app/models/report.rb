class Report < ActiveRecord::Base
	validates	:generation,	presence: true
	validates	:content, 		presence: true
end
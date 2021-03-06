class Report < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates	:generation,	presence: true
	validates	:content, 		presence: true

	include PgSearch
	pg_search_scope(:search_text,
		:against => {
			:content => 'A',
			:hospital => 'B',
			:birthday => 'C'
		},
		:using => {
			:tsearch => { :prefix => true },
			:dmetaphone => {},
			:trigram => {}})
end
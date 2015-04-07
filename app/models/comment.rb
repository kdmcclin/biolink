class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :report
	
	validates :content, presence: :true
end
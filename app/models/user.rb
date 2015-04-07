class User < ActiveRecord::Base
	has_many :reports
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :displayname, presence: 	:true,
							uniqueness: :true
end

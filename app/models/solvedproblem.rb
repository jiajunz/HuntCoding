class Solvedproblem < ActiveRecord::Base
	belongs_to :user
	has_many :submissions
	validates :user_id, presence:true
end

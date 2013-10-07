class OjProblem < ActiveRecord::Base
	default_scope -> { order('created_at DESC')}
	has_many :submissions, dependent: :destroy
end

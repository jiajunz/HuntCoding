class User < ActiveRecord::Base
	has_many :solvedproblems
	has_many :submissions, through: :solvedproblems
	before_save {self.email = email.downcase}
	validates :username, presence: true, length: {maximum:50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:true, format: {with:VALID_EMAIL_REGEX},
	           uniqueness: {case_sensitive: false }
	has_secure_password
	validates :password, length: {minimum:6}


	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def get_solved_problem(pid)
		Solvedproblem.where(user_id:self.id).where(oj_problem_id: pid).first
	end

	private
	    def create_remember_token
	    	self.remember_token = User.encrypt(User.new_remember_token)
	    end
end

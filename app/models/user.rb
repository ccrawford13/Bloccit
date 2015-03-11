class User < ActiveRecord::Base
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  def member?
    role == 'member'
  end


end

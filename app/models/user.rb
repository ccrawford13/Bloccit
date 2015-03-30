class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  
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

  def favorited(post)
    favorites.where(post_id: post.id).first
  end

  def voted(post)
    if votes.where(post_id: post.id)
      votes.where(post_id: post.id).first
    else
      nil
    end
  end

  def self.top_rated
    self.select('users.*')
    .select('COUNT(DISTINCT comments.id) AS comments_count')
    .select('COUNT(DISTINCT posts.id) AS posts_count')
    .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank')
    .joins(:posts)
    .joins(:comments)
    .group('users.id')
    .order('rank DESC')
  end
end

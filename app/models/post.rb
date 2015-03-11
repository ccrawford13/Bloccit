class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  #Sets the order of posts to 'descending' by time of post
  default_scope { order('created_at DESC') }
end

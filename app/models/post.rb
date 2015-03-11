class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  #Sets the order of posts to 'descending' by time of post
  # default_scope { order('created_at DESC') }
  
  #ASC = A-Z Sort, DESC = Z-A Sort
  scope :ordered_by_title, -> { order('title DESC') }
  #Sorted to show oldest post first - Could use similar ordering for Comments?
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC')}

end

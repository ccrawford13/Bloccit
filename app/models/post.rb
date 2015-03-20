class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  mount_uploader :image, ImageUploader
  #Sets the order of posts to 'descending' by time of post
  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true
  
  def markdown_title
    render_as_markdown(title)
  end

  def markdown_body
    render_as_markdown(body)
  end

  private

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new(render_options = {safe_links_only: true})
    extensions = { fenced_code_blocks: true, quote: true }
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end


end

class Category < ActiveRecord::Base
  
  attr_accessible :name
  default_scope :order => "created_at DESC"
  validates :name, :presence => true, :length => {:minimum => 5, :maximum => 50}
  has_many :posts
  
  
  
  def self.default
  find_or_create_by_name("Article")
  end
  
  after_destroy do
  manage_posts
  end
  
  def manage_posts
  posts.each do |post|
  post.update_attribute(:category_id, Category.default.id)
  end
  
end

end

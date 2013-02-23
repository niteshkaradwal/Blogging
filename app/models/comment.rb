class Comment < ActiveRecord::Base
  belongs_to :post
  has_many :likes, :as => :liker, :dependent => :destroy 
  belongs_to :user, :class_name => "User", :foreign_key => "commenter_id"
  attr_accessible :commenter_id, :content, :post_date, :post_id, :status
  validates :content,  :presence => true
  scope :pendding_records, lambda { |comment| where("post_id = ? AND status = ?", comment.post_id, false) }
  def commenter_is_current_user?(current_user)
    commenter_id == current_user.id
  end
  
  def self.more_comment_exists?(comment)
    pendding_records(comment).present? 
  end
  
  
end

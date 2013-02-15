class Comment < ActiveRecord::Base
  belongs_to :post
  has_many :likes, :as => :liker
  belongs_to :user, :class_name => "User", :foreign_key => "commenter_id"
  attr_accessible :commenter_id, :content, :post_date, :post_id, :status
  
  validates :content,  :presence => true
end

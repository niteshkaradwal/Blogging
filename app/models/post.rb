class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  belongs_to :user
  validates :title, :presence => true
  validates :body, :presence => true, :length => { :minimum => 10 }
  has_many :comments, :dependent => :destroy
  has_many :likes, :as => :liker, :dependent => :destroy                
  def postOwner_is_current_user?(current_user)
    user_id == current_user.id 
  end
  scope :order_by_time, order("created_at desc")
  

end

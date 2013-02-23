class Follower < ActiveRecord::Base
  attr_accessible :follower_id, :user_id
  belongs_to :follw, :class_name => "User", :foreign_key => "follower_id"
  belongs_to :user  
  
  def follower_is_current_user?(current_user)
    current_user.id == user_id
  end
end

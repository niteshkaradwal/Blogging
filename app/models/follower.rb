class Follower < ActiveRecord::Base
  attr_accessible :follower_id, :user_id
  belongs_to :follow, :class_name => "User", :foreign_key => "follower_id"
	belongs_to :user	
end

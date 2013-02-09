class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  belongs_to :user
  validates :title, :presence => true
  validates :body, :presence => true,
										:length => { :minimum => 10 }
	has_many :comments	
	has_many :likes, :as => :liker								
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :birth_date, :gender
  validates :gender, :presence => true
  
  # attr_accessible :title, :body
  has_many :followers
  has_many :follws, :class_name => "Follower", :foreign_key => "follower_id"
  has_many :followed, :through => :followers, :source => "follw", :class_name => "User"
  has_many :follow_users, :through => :follws, :source => "user", :class_name => "User"
  has_many :posts
  has_many :comments
end



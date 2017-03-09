class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  
  validates :username, presence: true
  has_many :reviews
  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  has_many :followed_users, through: :followed_relationships, source: :follower
  
  def reviewed?(movie)
    reviews.exists?(movie_id: movie.id)
  end
  
  def follow(other_user)
    following_relationships.create(followed_id: other_user.id)
  end
  
  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def following?(user)
    return true if following_relationships.exists?(followed_id: user.id)
  end
  
end

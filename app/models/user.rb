class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  
  validates :username, presence: true
  has_many :reviews
  
  def reviewed?(movie)
    reviews.exists?(movie_id: movie.id)
  end
  
end

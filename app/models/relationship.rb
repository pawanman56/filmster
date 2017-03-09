class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower, :followed, presence: true
  validates :followed_id, uniqueness: {scope: :follower_id}
end

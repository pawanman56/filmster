class Review < ActiveRecord::Base
  validate :user, :movie, :comment
  belongs_to :user
  belongs_to :movie
  has_many :votes
  
  scope :recent, -> {order("created_at DESC").limit(5)}
end

class Review < ActiveRecord::Base
  validate :user, :movie, :comment
  belongs_to :user
  belongs_to :movie
end

class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @movies = Movie.all.includes(:reviews)
    end
    
    def timeline
        @reviews = Review.where(user_id: current_user.following_users).order("created_at DESC")
    end
    
end

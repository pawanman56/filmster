class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @movies = Movie.all.includes(:reviews)
    end
    
end

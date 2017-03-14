class VotesController < ApplicationController
    
    def create
        @review = Review.find(params[:review_id])
        @review.votes.create(user_id: current_user.id)
        
        respond_to do |format|
            format.html { redirect_to movie_path }
            format.js {}
        end
    end
    
    def show
        @votes = current_user.votes.find_by(review_id: @review.id)
    end
    
    def destroy
        @review = Review.find(params[:review_id])
        @vote = Vote.find_by(user_id: params[:user_id])
        @vote.destroy
        
        respond_to do |format|
            format.html { redirect_to movie_path }
            format.js {}
        end
    end
    
end

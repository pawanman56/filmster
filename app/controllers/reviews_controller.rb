class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @movie = MovieBuilder.new(imdbid: params[:imdbid]).build!
        @review = current_user.reviews.new(review_params.merge(movie: @movie))
        
        if @review.save
            flash[:success] = "Review saved!"
            redirect_to movie_path(@movie.id)
        else
            flash[:alert] = "Woops! Something went wrong."
            redirect_to movie_path(@movie.id)
        end
    end
    
    private
    
    def review_params
        params.require(:review).permit(:comment)
    end
    
end

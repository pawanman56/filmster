class StaticPagesController < ApplicationController
    
    def index
        @movie = Movie.recent
        @recent_reviews = Review.recent
    end
    
end

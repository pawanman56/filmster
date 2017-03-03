class StaticPagesController < ApplicationController
    
    def index
        @movie = Movie.includes(:reviews)
    end
    
end

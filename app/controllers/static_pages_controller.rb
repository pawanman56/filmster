class StaticPagesController < ApplicationController
    
    def index
        @movie = Movie.joins(:reviews)
    end
    
end

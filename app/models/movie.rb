class Movie < ActiveRecord::Base
    
    validate :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot, :language, :country, :awards, :poster, :metascore, :imdbrating, :imdbvotes, :imdbid
    has_many :reviews
    
end

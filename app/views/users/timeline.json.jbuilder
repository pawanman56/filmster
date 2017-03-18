json.reviews do
    json.array! @reviews do |review|
        json.user review.user
        json.movie review.movie, :title, :id, :year, :imdbrating, :imdbid, :poster
        json.comment review.comment
    end
end
/* global $ */
/* global id */

$(function(){
    let form = $('#movie-search');
    form.submit(function(e){
        e.preventDefault();
            $.ajax({
            url: 'https://www.omdbapi.com/?',
            data: form.serialize()
        })
        .done(function(data){
            displayMovies(data);
        });
    });
    
    function displayMovies(data){
        let container = $("#movies")
        let htmlString = "";
        
        container.empty();
        
        if (data["Response"] == "False") {
            htmlString = `<div class="alert alert-danger text-center" role="alert">${data["Error"]}</div>`;
        } else {
            data["Search"].forEach(function(movie){
                htmlString += `<div class="box panel panel-default pull-left">
                                    <img src=${movie["Poster"] == "N/A" ? "assets/default_image.png" : movie["Poster"]} data-id="${movie['imdbID']}" />
                                        <div class="panel-body">
                                            <p>${movie["Title"]}</p>
                                            <p>${movie["Year"]}</p>
                                        </div>
                                </div>`;
            });
        }
        
        container.append(htmlString);
    }
    
    $("#movies").on('click', 'img', function(e){
        e.preventDefault();
        
        let id = $(e.target).data('id');
        
        $.ajax({
            url: 'https://www.omdbapi.com/?',
            data: {i: id}
        })
        .done(function(data){
            displayMovie(data);
        });
    });
    
    function displayMovie(data){
        let container = $("#movies");
        let htmlString = "";
        
        container.empty();
        
        htmlString +=
        `<div class="col-xs-4 col-md-4">
            <img src=${data["Poster"] == "N/A" ? "assets/default_image.png" : data["Poster"]} data-id="${data['imdbID']}" />
        </div>
        <div class="col-xs-6 col-md-8">
            <h1>${data["Title"]}</h1>
            <h1>${data["Year"]}</h1><hr />
            <p>Actors: ${data["Actors"]}</p>
            <p>Awards: ${data["Awards"]}</p>
            <p>Country: ${data["Country"]}</p>
            <p>Director: ${data["Director"]}</p>
            <p>Genre: ${data["Genre"]}</p>
            <p>Language: ${data["Language"]}</p>
            <p>Metascore: ${data["Metascore"]}</p>
            <p>Plot: ${data["Plot"]}</p>
            <p>Rated: ${data["Rated"]}</p>
            <p>Released: ${data["Released"]}</p>
            <p>Runtime: ${data["Runtime"]}</p>
            <p>Writer: ${data["Writer"]}</p>
            <p>omrvRating: ${data["imdbRating"]}</p>
            <p>omrvVotes: ${data["imdbVotes"]}</p>
        </div>`;
        
        container.append(htmlString);
    }
    
})
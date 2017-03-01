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
        let container = $("#movies");
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
            <p><label>Actors: </label> ${data["Actors"]}<br />
            <label>Awards: </label> ${data["Awards"]}<br />
            <label>Country: </label> ${data["Country"]}<br />
            <label>Director: </label> ${data["Director"]}<br />
            <label>Genre: </label> ${data["Genre"]}<br />
            <label>Language: </label> ${data["Language"]}<br />
            <label>Metascore: </label> ${data["Metascore"]}<br />
            <label>Plot: </label> ${data["Plot"]}<br />
            <label>Rated: </label> ${data["Rated"]}<br />
            <label>Released: </label> ${data["Released"]}<br />
            <label>Runtime: </label> ${data["Runtime"]}<br />
            <label>Writer: </label> ${data["Writer"]}<br />
            <label>OMRv Rating: </label> ${data["imdbRating"]}<br />
            <label>OMRv Votes: </label> ${data["imdbVotes"]}</p><hr />
            
            <form id="rating-form" action="/reviews" method="POST">
                <input type="hidden" name="authenticity_token" value=${window._token} />
                <input type="hidden" name="imdbid" value=${data["imdbID"]} />
                <textarea name= "review[comment]" class="form-control" placeholder="Your movie review"/>
                <br />
                <input type="submit" class="btn btn-success pull-right" />
            </form>
        </div>
        `;
        
        container.append(htmlString);
        container.imagesLoaded(function(){
            container.masonry({
                itemSelector: '.panel',
                fitWidth: true
            });
        });    
    }
    
    $('#movies').imagesLoaded(function(){
        $('#movies').masonry({
            itemSelector: '.panel',
            fitWidth: true
        }); 
    });
    
})
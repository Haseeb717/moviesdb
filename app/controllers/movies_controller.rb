class MoviesController < ApplicationController
  def index
  	category = rand(0..4)
  	page = rand(1..5)
  	
  	if category == 0
  		list = Tmdb::Discover.movie(page: page)
  	elsif category == 1
  		list = Tmdb::Movie.upcoming(page: page)
  	elsif category == 2
  		list = Tmdb::Movie.now_playing(page: page)
  	elsif category == 3
  		list = Tmdb::Movie.popular(page: page)
  	elsif category == 4
  		list = Tmdb::Movie.top_rated(page: page)
  	end
  	@movies = list["results"]
  end

  def rating
  	movie_id = params["id"]
  	action = params["user_action"]
  	
  	if action == "up"
  		Rating.create(:movie_id=>movie_id,:star=>true,:score=>2)
  	elsif action == "down"
  		Rating.create(:movie_id=>movie_id,:score=>0)
  	elsif action == "right"
  		Rating.create(:movie_id=>movie_id,:score=>1)
  	elsif action == "left"
  		Rating.create(:movie_id=>movie_id,:score=>-1)
  	end
  		
  	render :json => {:success => true,:movie_id=>movie_id}
  end
end

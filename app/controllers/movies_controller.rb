class MoviesController < ApplicationController

  def index
    @movies = Movie.all.limit(10)
  end

  def show
    id = ( params[:id] || 1 )
    @movie = Movie.find(id)
  end

end

class MoviesController < ApplicationController

  def index
    @movies = Movie.all.limit(10)
  end

  def show
    id = ( params[:id] || 1 )
    @movie = Movie.find(id)
  end

  def search
    server = Stretcher::Server.new('http://localhost:9200') 
    query = {query_string: { query: params[:q], fields: ['title', 'director'] } }
    results = server.index(:movies).search(size: 12, query: query)
    render :json => results.raw.hits.hits.map { |m| m._source.as_json(:only => [:title, :director, :year]) }
  end

end

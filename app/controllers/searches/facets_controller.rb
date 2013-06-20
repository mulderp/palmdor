class Searches::FacetsController < ApplicationController

  def create
    server = Stretcher::Server.new('http://localhost:9200') 
    query = {query_string: { query: params[:q], fields: ['title', 'director', 'categories'] } }
    results = server.index(:movies).search(size: 12, query: query)
    render :json => results.raw.hits.hits.map { |m| m._source.as_json(:only => [:title, :director, :categories, :year]) }
  end

end

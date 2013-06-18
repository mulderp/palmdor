namespace :index do

  desc "Update index"
  task :create => :environment do
    server = Stretcher::Server.new('http://localhost:9200')
    server.index(:movies).delete rescue nil
    server.index(:movies).create(mappings: {
      movie: {
        properties: {
          category: {
            type: 'string'
          },
          title: {
            type: 'string',
            analyzer: 'simple'
          },
          director: {
            type: 'string'
          },
          actors: {
            type: 'string'
          },
          year: {
            type: 'integer'
          }
        }
      }
    })
  end

  desc "insert index"
  task :insert => :environment do
    server = Stretcher::Server.new('http://localhost:9200') 
    Movie.all.each do |movie|
      server.index(:movies).type(:movie).post(movie.to_json)
    end
  end

  desc "Show status"
  task :status => :environment do
    server = Stretcher::Server.new('http://localhost:9200') 
    puts server.status.to_yaml
    # 30.times {|t| server.index(:foo).type(:tweet).put(t, {text: "Hello #{t}"}) }
  end

  desc "Show stats"
  task :stats => :environment do
    server = Stretcher::Server.new('http://localhost:9200') 
    puts server.stats.to_yaml
  end

  desc "Show mappings"
  task :mappings => :environment do
    server = Stretcher::Server.new('http://localhost:9200') 
    puts server.index(:"_all").get_mapping.to_yaml
  end

  desc "Search"
  task :search => :environment do
    server = Stretcher::Server.new('http://localhost:9200') 
    query = {match: { year: 1987 } }
    query = {query_string: { query: 'fire', default_field: 'title' } }
    puts server.index(:movies).search(size: 12, query: query)
  end

end

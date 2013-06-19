namespace :index do

  desc 'Remove index'
  task :clean => :environment do
    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG
    server_url = ENV['BONSAI_URL']
    server = Stretcher::Server.new(server_url, :logger => logger)
    server.index(:movies).delete rescue nil
  end

  desc "Update index"
  task :create => :environment do
    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG
    server_url = ENV['BONSAI_URL']
    server = Stretcher::Server.new(server_url, :logger => logger)
    # server.index(:movies).delete rescue nil
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
    server_url = ENV['BONSAI_URL']
    server = Stretcher::Server.new(server_url)
    Movie.all.each do |movie|
      server.index(:movies).type(:movie).post(movie.to_json)
    end
  end

  desc "Show status"
  task :status => :environment do
    server_url = ENV['BONSAI_URL']
    server = Stretcher::Server.new(server_url)
    puts server.status.to_yaml
    # 30.times {|t| server.index(:foo).type(:tweet).put(t, {text: "Hello #{t}"}) }
  end

  desc "Show stats"
  task :stats => :environment do
    server_url = ENV['BONSAI_URL']
    server = Stretcher::Server.new(server_url)
    puts server.stats.to_yaml
  end

  desc "Show mappings"
  task :mappings => :environment do
    server_url = ENV['BONSAI_URL']
    server = Stretcher::Server.new(server_url)
    puts server.index(:"_all").get_mapping.to_yaml
  end

  desc "Search"
  task :search => :environment do
    server_url = ENV['BONSAI_URL']
    server = Stretcher::Server.new(server_url)
    query = {match: { year: 1987 } }
    query = {query_string: { query: 'fire', default_field: 'title' } }
    puts server.index(:movies).search(size: 12, query: query)
  end

end

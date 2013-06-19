
[[1974, %q(The Conversation), %q(Francis Ford Coppola), %w(drama mystery thriller), %q(A paranoid and personally-secretive surveillance expert has a crisis of conscience when he suspects that a couple he is spying on will be murdered.)],
[1975, %q(Chronicle of the Years of Fire), %q(Mohammed Lakhdar-Hamina), %w(drama documentation), %q(It depicts the Algerian War of Independence as seen through the eyes of a peasant.), %q(Chronique des années de braise) ],
[1976, %q(Taxi Driver), %q(Martin Scorsese), %w(crime drama), %q{Travis Bickle (Robert De Niro), an honorably discharged U.S. Marine, is a lonely and depressed man living in Manhattan, New York. He becomes a taxi driver in order to cope with chronic insomnia, driving passengers every night around the boroughs of New York City. He also spends time in seedy porn theaters and keeps a diary.}],
[1979, %q(Apocalypse Now), %q(Francis Ford Coppola), %w(drama war)],
[1984, %q(Paris, Texas), %q(Wim Wenders), %w(drama)],
[1986, %q(The Mission), %q(Roland Joffé), %w(drama adventure history)]].each do |movie|
  m = Movie.new(:title => movie[1], :original_title => movie[5], :year => movie[0], :director => movie[2])
  genres = movie[3].map { |g| Category.where(:name => g).first_or_create }
  m.categories = genres 
  m.save
end

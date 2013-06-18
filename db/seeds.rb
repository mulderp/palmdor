
[[1974, %q(The Conversation), %q(Francis Ford Coppola)],
[1975, %q(Chronicle of the Years of Fire), %q(Chronique des années de braise), %q(Mohammed Lakhdar-Hamina)],
[1976, %q(Taxi Driver), %q(Martin Scorsese)],
[1979, %q(Apocalypse Now), %q(Francis Ford Coppola)],
[1984, %q(Paris, Texas), %q(Wim Wenders)],
[1986, %q(The Mission), %q(Roland Joffé)]].each do |movie|
  Movie.create(:title => movie[1], :year => movie[0], :director => movie[2])
end

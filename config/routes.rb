Palmdor::Application.routes.draw do

  root 'movies#index'

  get '/search', :to => 'movies#search'
 
end

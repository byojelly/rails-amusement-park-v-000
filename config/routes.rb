Rails.application.routes.draw do

root "welcome#home"

resources :users#, only: [:new, :create]

#get '/login' => 'sessions#new'
#post '/login' => 'sessions#create'
#post '/logout' => "sessions#destroy"

end

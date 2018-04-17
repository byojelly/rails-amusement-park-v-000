Rails.application.routes.draw do

#root
root "static_pages#home"




#sessions - loggin in and out
get '/signin' => 'sessions#new'
post '/sessions/create' => 'sessions#create'
delete '/signout' => "sessions#destroy"
get '/sessions/destroy' => 'sessions#destroy'

#rides
post "/rides/new" => 'rides#new'

resources :users#, only: [:new, :create]
resources :attractions

end

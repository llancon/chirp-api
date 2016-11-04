Rails.application.routes.draw do


  post '/login' => 'users#login'
  post '/signup' => 'users#create'
  resources :users do
  resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

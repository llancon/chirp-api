Rails.application.routes.draw do


  post '/login' => 'users#login'
  post '/signup' => 'users#create'
  get '/all' => 'users#index'
  post '/follow' => 'users#follow_user'
  post '/unfollow' => 'users#unfollow_user'
  get '/allfollowers' => 'user#all_followers'
  resources :users do
  resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

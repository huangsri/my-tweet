Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets

  post '/tweets/:id', to: 'tweets#like'
  

  # namespace :tweets do
  #   # resources :likes, module: :tweets, only: :toggle
  #   # post 'likes', to: 'likes#toggle'
  #   resources :likes
  # end

  # get 'tweets/:tweet_id/likes/:id', to: 'likes#show'

  root to: "tweets#index"
end

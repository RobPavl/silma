Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'	
  root 'categories#index'
  resources :posts
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

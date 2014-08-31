Rails.application.routes.draw do
  resources :streams
  resources :subscriptions
  root 'streams#new'
end

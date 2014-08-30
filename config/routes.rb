Rails.application.routes.draw do
  resources :streams
  root 'streams#index'
end

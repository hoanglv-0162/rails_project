Rails.application.routes.draw do
  resources :favorite_songs
  resources :review_songs
  resources :songs
  get 'users/show'
  get 'static_pages/home'
  root 'static_pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

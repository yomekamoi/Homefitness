Rails.application.routes.draw do
  resources :reviews, only: [:index, :destroy]
  root 'homes#top'
  get 'homes/about'
	devise_for :users
  resources :posts do
    resources :reviews, except: [:index, :destroy]
  end


  resources :users,only: [:show,:edit,:update,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

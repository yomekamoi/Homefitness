Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
  resources :reviews, only: [:index, :destroy]
  root 'homes#top'
  get 'homes/about'
  get 'trainings/index'
  get 'trainings/new'
  get 'trainings/:id' => 'trainings#show'
  post 'trainings/create' => 'trainings#create'
  get 'trainings/:id/edit' => 'trainings#edit'
  post "trainings/:id/update" =>"trainings#update"
  post "trainings/:id/destroy" =>"trainings#destroy"



	devise_for :users
  resources :post_images, only: [:new, :create, :index, :show]
  resources :posts do
    resources :reviews, except: [:index, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end


  resources :users,only: [:show,:edit,:update,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

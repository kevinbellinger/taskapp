Rails.application.routes.draw do
  
  devise_for :users
root to: 'welcome#index'
resources :todos, only: [:new, :create, :show, :index, :destroy]

end

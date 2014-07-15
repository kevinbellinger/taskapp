Rails.application.routes.draw do
  
  devise_for :users
  
  root to: 'welcome#index'

  resources :todos do
    collection do
      post :update_complete
    end
  end

  resources :welcome do 
  end
end

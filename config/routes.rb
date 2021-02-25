Rails.application.routes.draw do
  resources :cards, except: [:index]
  resources :lists, except: [:index]
  resources :boards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]

  delete :logout, to: "sessions#logout"

  get :logged_in, to: "sessions#logged_in"
  
  root to: "static#home"

  resources :boards do 
    resources :lists, only: [:index]
  end

  resources :lists do 
    resources :cards, only: [:index]
  end

end

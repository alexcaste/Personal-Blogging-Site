Rails.application.routes.draw do
  root :to => 'skills#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, :only => [:show]
  resources :cancels, :only => [:index]

  resources :skills do
    resources :projects, :except => [:index]
  end
end

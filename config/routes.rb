Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :home, :only => [:index]
  resources :users, :only => [:show, :index]
  resources :cancels, :only => [:index]

  resources :skills do
    resources :projects, :except => [:index]
  end

  resources :posts do
    resources :comments
  end
end

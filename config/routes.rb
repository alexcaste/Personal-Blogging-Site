Rails.application.routes.draw do
  root :to => 'skills#index'

  resources :skills do
    resources :projects, :except => [:show, :index]
  end
end

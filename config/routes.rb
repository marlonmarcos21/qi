Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :locations, only: :show
  end

  resources :locations, except: %i(index show)

  root to: 'users#index'
end

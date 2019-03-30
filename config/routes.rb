Rails.application.routes.draw do
  resources :days
  resources :entries do
    put 'archive', on: :member
    put 'unarchive', on: :member
  end
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "entries#index"
end

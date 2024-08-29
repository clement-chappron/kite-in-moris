Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    patch 'update_profile_picture', to: 'users/registrations#update_profile_picture', as: :update_profile_picture
  end

  root to: "pages#home"

  resources :locations, only: [:index]

end

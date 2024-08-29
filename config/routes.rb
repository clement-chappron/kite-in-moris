Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "pages#home"

  resources :locations, only: [:index]

  # Modidication de l'image de profil
  # patch 'update_profile_picture', to: 'pages#update_profile_picture'
   patch 'update_profile_picture', to: 'users/registrations#update_profile_picture'

end

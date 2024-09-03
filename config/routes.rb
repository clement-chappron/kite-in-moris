Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    patch 'update_profile_picture', to: 'users/registrations#update_profile_picture', as: :update_profile_picture
    get 'users/profile', to: 'users/registrations#edit_image_and_bio', as: :edit_image_and_bio
    patch 'update_image_and_bio', to: 'users/registrations#update_image_and_bio', as: :update_image_and_bio
  end

  root to: "pages#home"

  resources :locations, only: [:index]
  resources :blog_pages

  resources :schools do
    resources :reviews
  end

  resources :shops do
    resources :reviews
  end
end

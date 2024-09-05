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
  get 'filter_categories', to: 'pages#filter_categories'

  resources :locations, only: [:index]

  resources :blog_pages do
    resources :comment_blogs, only: [:index, :new, :create]
  end

  resources :schools do
    resources :review_schools, only: [:index, :new, :create]

    collection do
      post :create_step_1
      patch :create_step_2
      patch :create_step_3
      patch :create_step_4
    end
  end

  resources :shops do
    resources :review_shops, only: [:index, :new, :create]
  end

  resources :spots, only: [:index, :show] do
    resources :review_spots, only: [:index, :new, :create]
  end
end

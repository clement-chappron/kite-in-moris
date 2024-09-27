Rails.application.routes.draw do
  get 'companies/new'
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
  get 'create_company', to: 'pages#create_company'

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
    get 'load_more_reviews', to: 'review_schools#load_more'
    get 'search', to: 'pages#search'
  end

  resources :shops, except: [:index] do
    resources :review_shops, only: [:index, :new, :create]

    collection do
      post :create_step1
      post :create_step2
    end
  end

  resources :spots, param: :slug, only: [:show, :edit, :update] do
    resources :review_spots, only: [:new, :create]
  end
  get 'load_more', to: 'review_spots#load_more'
  get 'load_more_shop_reviews', to: 'review_shops#load_more'
  get 'load_more_school_reviews', to: 'review_schools#load_more'

  get 'search', to: 'pages#search'

end

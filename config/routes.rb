# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :jobs, only: [:index, :show]
  resources :articles, only: [:index, :show]

  devise_for :users,
    class_name: 'Recruiter::User',
    # module: 'devise',
    controllers: { omniauth_callbacks: "recruiter/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in',  to: '/devise/sessions#new',     as: :new_user_session
    get 'sign_out', to: '/devise/sessions#destroy', as: :destroy_user_session
  end

  scope :profile, module: :users, as: :user do
    resources :jobs
    resources :articles
  end

  get 'filters' => 'filters#index', as: :filters
end

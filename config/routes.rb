# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'recruiter/home#index'

  resources :jobs, only: [:index, :show], controller: 'recruiter/jobs'
  resources :articles, only: [:index, :show], controller: 'recruiter/articles'

  devise_for :users,
    class_name: 'Recruiter::User',
    controllers: { omniauth_callbacks: "recruiter/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in',  to: 'devise/sessions#new',     as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  scope :profile, as: :user do
    resources :jobs, controller: 'recruiter/users/jobs'
    resources :articles, controller: 'recruiter/users/articles'
  end

  get 'filters' => 'recruiter/filters#index', as: :filters
end

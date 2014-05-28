Rails.application.routes.draw do

  root to: 'jobs#index'

  resources :jobs, only: [:show], as: :offer

  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  scope :profile, module: :users do
    resources :jobs
  end
end

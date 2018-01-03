Rails.application.routes.draw do
  mount Recruiter::Engine, at: '/'
  root to: 'recruiter/jobs#index'

  get 'error', to: 'exception#index'
end

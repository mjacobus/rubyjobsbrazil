Rails.application.routes.draw do
  mount Recruiter::Engine, at: '/'
  root to: 'recruiter/jobs#index'
end

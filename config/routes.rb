# frozen_string_literal: true

Rails.application.routes.draw do
  get '/env', to: ->(env) { [200, {}, [Rails.env.to_s]] }
end

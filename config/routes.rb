# frozen_string_literal: true

Rails.application.routes.draw do
  get '/env', to: ->(_env) { [200, {}, [Rails.env.to_s]] }
end

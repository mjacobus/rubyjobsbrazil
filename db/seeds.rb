# encoding: UTF-8
require_relative 'seeds/brazilian_states_and_cities'

Recruiter::Tag.find_or_create_by!({
  name: 'Home Office'
})

Recruiter::Tag.find_or_create_by!({
  name: 'Full Time'
})

Recruiter::Tag.find_or_create_by!({
  name: 'Part Time'
})

Recruiter::Tag.find_or_create_by!({
  name: 'Presencial'
})

Recruiter::Tag.find_or_create_by!({
  name: 'PJ'
})

Recruiter::Tag.find_or_create_by!({
  name: 'CLT'
})

Recruiter::Tag.find_or_create_by!({
  name: 'Freela'
})

Recruiter::Tag.find_or_create_by!({
  name: 'Estágio'
})

require_relative "seeds/development" if Rails.env.development?

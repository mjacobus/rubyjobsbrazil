require_relative 'seeds/brazilian_states_and_cities'
require_relative "seeds/development" if Rails.env.development?

Tag.find_or_create_by!({
  name: 'Home Office'
})

Tag.find_or_create_by!({
  name: 'Full Time'
})

Tag.find_or_create_by!({
  name: 'Part Time'
})

Tag.find_or_create_by!({
  name: 'Presencial'
})

Tag.find_or_create_by!({
  name: 'PJ'
})

Tag.find_or_create_by!({
  name: 'CLT'
})

Tag.find_or_create_by!({
  name: 'Freela'
})

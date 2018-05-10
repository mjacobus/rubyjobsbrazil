# frozen_string_literal: true

require 'machinist/active_record'
require 'faker'

User.blueprint do
  name     { "The Name #{sn}" }
  email    { "email#{sn}@example.com" }
  provider { 'github' }
  uid      { sn }
end

Job.blueprint do
  user
  title { "ruby job #{sn}" }
  description { 'the requirements' }
  how_to_apply { 'how to apply' }
  city
end

State.blueprint do
  name  { Faker::Address.city }
  short { sn.to_s }
end

City.blueprint do
  name  { Faker::Address.city }
  short { sn.to_s }
  state
end

Tag.blueprint do
  name { "tag #{sn}" }
end

Article.blueprint do
  user
  title { "ruby article #{sn}" }
  body { 'article body' }
  published { true }
end

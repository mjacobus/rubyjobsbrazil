require 'machinist/active_record'
require 'faker'

Recruiter::User.blueprint do
  name     { "The Name #{sn}" }
  email    { "email#{sn}@example.com" }
  provider { 'github' }
  uid      { sn }
end

Recruiter::Job.blueprint do
  user
  title { "ruby job #{sn}" }
  description { "the requirements" }
  how_to_apply { "how to apply" }
  city
end

Recruiter::State.blueprint do
  name  { Faker::Address.city }
  short { "#{sn}" }
end

Recruiter::City.blueprint do
  name  { Faker::Address.city }
  short { "#{sn}" }
  state
end

Recruiter::Tag.blueprint do
  name { "tag #{sn}" }
end

Recruiter::Article.blueprint do
  user
  title { "ruby article #{sn}" }
  body { "article body" }
  published { true }
end

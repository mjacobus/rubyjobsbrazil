require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  name     { "The Name #{sn}" }
  email    { "email#{sn}@example.com" }
  provider { 'github' }
  uid      { sn }
end

Job.blueprint do
  user
  title { "ruby job #{sn}" }
  description { "the requirements" }
  how_to_apply { "how to apply" }
  city
end

City.blueprint do
  name  { Faker::Address.city }
  short { "#{sn}" }
  state
end

State.blueprint do
  name  { Faker::Address.city }
  short { "#{sn}" }
end

Tag.blueprint do
  name { "tag #{sn}" }
end

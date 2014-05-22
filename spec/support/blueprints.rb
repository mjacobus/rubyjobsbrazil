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

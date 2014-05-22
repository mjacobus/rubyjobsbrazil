require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  email    { "email#{s}@example.com" }
  provider { 'github' }
  uid      { "#{s}" }
end

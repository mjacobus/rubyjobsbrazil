class RemoveEmailIndex < ActiveRecord::Migration
  def change
    remove_index :recruiter_users, :email
  rescue
    puts "there was no index on the recruiter_users.email"
  end
end

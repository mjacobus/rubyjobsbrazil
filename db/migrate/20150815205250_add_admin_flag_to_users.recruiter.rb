# This migration comes from recruiter (originally 20150815184100)
class AddAdminFlagToUsers < ActiveRecord::Migration
  def change
    add_column :recruiter_users, :admin, :boolean, default: false
  end
end

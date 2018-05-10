# frozen_string_literal: true

class RemoveEmailIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :recruiter_users, :email
  rescue StandardError
    puts 'there was no index on the recruiter_users.email'
  end
end

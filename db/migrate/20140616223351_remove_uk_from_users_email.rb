# frozen_string_literal: true

class RemoveUkFromUsersEmail < ActiveRecord::Migration[5.2]
  def up
    remove_index :recruiter_users, :email
  rescue StandardError
    puts 'table users does not exist'
  end

  def down
    add_index :recruiter_users, :email, unique: true
  rescue StandardError
    puts 'table users does not exist'
  end
end

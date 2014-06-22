class RemoveUkFromUsersEmail < ActiveRecord::Migration
  def up
    remove_index :users, :email
  rescue
    puts "table users does not exist"
  end

  def down
    add_index :users, :email, unique: true
  rescue
    puts "table users does not exist"
  end
end

class AllowUserEmailToBeNull < ActiveRecord::Migration
  def up
    change_column :users, :email, :string, default: nil, null: true
  end

  def down
    change_column :users, :email, :string, null: false, default: ""
  end
end

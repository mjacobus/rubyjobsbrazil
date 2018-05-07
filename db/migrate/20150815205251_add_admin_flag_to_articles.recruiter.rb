# frozen_string_literal: true

# This migration comes from recruiter (originally 20150815200812)
class AddAdminFlagToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiter_articles, :admin, :boolean
  end
end

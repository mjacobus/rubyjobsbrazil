# frozen_string_literal: true

class ConvertToUtf8mb4UnicodeCi < ActiveRecord::Migration[5.2]
  attr_reader :charset
  attr_reader :collate
  # ALTER DATABASE database_name CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
  # ALTER TABLE table_name CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
  # ALTER TABLE table_name MODIFY column TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
  def up
    @charset = 'utf8mb4'
    @collate = 'utf8mb4_unicode_ci'
    apply
  end

  def down
    @charset = 'utf8'
    @collate = 'utf8_general_ci'
    apply
  end

  private

  def apply
    apply_to_database
    apply_to_table(:jobs, fields: %i[title description how_to_apply])
  end

  def apply_to_database
    execute("ALTER DATABASE #{db_name} CHARACTER SET #{charset} COLLATE #{collate}")
  end

  def apply_to_table(table, fields: [])
    execute("ALTER TABLE #{table} CHARACTER SET #{charset} COLLATE #{collate}")

    fields.each do |field|
      execute(
        "ALTER TABLE #{table} MODIFY #{field} TEXT CHARACTER SET #{charset} COLLATE #{collate}"
      )
    end
  end

  def db_name
    config = Rails.configuration.database_configuration[Rails.env.to_s] || {}
    config.fetch('database')
  end
end

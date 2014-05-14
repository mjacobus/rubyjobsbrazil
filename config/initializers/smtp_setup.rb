unless Rails.env.test?
  file = "#{Rails.root.to_s}/config/smtp.yml"

  if File.exists?(file)
    email_settings = YAML::load(File.open(file))

    unless email_settings[Rails.env].nil?
      ActionMailer::Base.smtp_settings = email_settings[Rails.env].symbolize_keys
    end
  end
end

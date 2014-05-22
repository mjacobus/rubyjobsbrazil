module EmailExamples
  def invalid_email_addresses
    %w(
      marcelo.jacobusgmail.com
      example@email
    )
  end

  def valid_email_addresses
    %w(
      marcelo.jacobus@gmail.com
      example@email.com
      a-bc@email.com
    )
  end
end

module EmailFormatValidationSpecHelper
  def it_validates_email_format_of(attribute)
    it "validates email format of #{attribute}" do
      valid_email_addresses.each do |email|
        subject.send("#{attribute}=", email)
        subject.valid?
        expect(subject.errors[attribute]).to be_empty
      end

      invalid_email_addresses.each do |email|
        subject.send("#{attribute}=", email)
        subject.valid?
        expect(subject.errors[attribute]).not_to be_empty
      end
    end
  end
end

RSpec.configure do |config|
  config.extend EmailFormatValidationSpecHelper
  config.include EmailExamples
end

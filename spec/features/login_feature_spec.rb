require "spec_helper"

feature "Login" do
  scenario "the user clicks the github login button" do
    visit '/'
    click_button t('.login')

    expect(page).to have_text(t('system.messages.login.success'))
  end
end

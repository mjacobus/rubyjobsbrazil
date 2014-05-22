require "spec_helper"

feature "Login" do
  scenario "the user clicks the github login button" do
    visit root_path
    click_link t('system.links.login.github')

    expect(page).to have_text(t('system.messages.account_created'))
  end
end

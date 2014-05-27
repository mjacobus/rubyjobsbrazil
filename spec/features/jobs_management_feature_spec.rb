require "spec_helper"

feature "Jobs Management" do
  include Features::Login

  scenario "creationg jobs" do
    visit root_path
    login_with_strategy(Oauth::Github)
    click_link t('system.links.jobs.new')

    within('#new_job') do
      fill_in 'job[title]', with: 'Job Position'
      fill_in 'job[description]', with: 'Job Description'
      fill_in 'job[how_to_apply]', with: 'How to Apply'

      click_button t('system.links.forms.save')
    end

    expect(page).to have_text(t('system.messages.crud.create.success'))
    expect(page).to have_text('Job Position')
    expect(page).to have_text('Job Description')
    expect(page).to have_text('How to Apply')
  end
end

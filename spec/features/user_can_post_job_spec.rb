require 'spec_helper'

feature "Jobs management" do
  include Features::Login

  scenario "user can post a new job", pending: true do
    user_logs_in_and_out_with(Oauth::Github)
    click_button(t('system.links.new_job'))

    within('#new_job') do
      fill_in 'job[title]', with: 'job title'
      fill_in 'job[description]', with: 'job description'
      fill_in 'job[how_to_apply]', with: 'how to apply'
      click_button 'submit'
    end

    expect(page).to have_text(t('system.messages.job_posted'))
  end

end

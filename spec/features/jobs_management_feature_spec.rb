# frozen_string_literal: true

require 'rails_helper'

feature 'Jobs Management' do
  include Features::Login

  context 'when user is logged in' do
    scenario 'he is able to publishe a job' do
      city
      visit root_path
      login_with_strategy(Oauth::Github)
      click_link t('recruiter.links.jobs.new')
      post_job
    end
  end

  context 'when user is not logged in' do
    scenario 'he is able to publishe a job' do
      city
      visit root_path
      click_link t('recruiter.links.jobs.new')
      within('#main_content') do
        login_with_strategy(Oauth::Github)
      end
      expect(page).not_to have_text(t('devise.failure.already_authenticated'))
      post_job
    end
  end

  def post_job
    within('#new_job') do
      fill_in 'job[title]', with: 'Job Position'
      fill_in 'job[description]', with: 'Job Description'
      fill_in 'job[how_to_apply]', with: 'How to Apply'
      select state.name, from: 'job[state_id]'
      click_button t('recruiter.submit.new')
    end

    within('#new_job') do
      select city.name, from: 'job[city_id]'
      click_button t('recruiter.submit.new')
    end

    expect(page).to have_text(t('recruiter.messages.crud.create.success'))
    expect(page).to have_text('Job Position')
    expect(page).to have_text('Job Description')
    expect(page).to have_text('How to Apply')
  end
end

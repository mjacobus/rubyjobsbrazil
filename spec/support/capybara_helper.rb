module CapybaraHelper

  def manage_store(provider = :facebook)
    create_dependencies
    login_with(provider)
    OwnershipAssignment.new(User.last, Store.make!).assign!
    visit managers_stores_path
  end

  def login_with(provider = :facebook)
    visit root_url
    first(:link, I18n.t("system.links.login.#{provider}")).click
  end

  def t(*args)
    I18n.t(*args)
  end

  def root_url
    Capybara.app_host
  end

  def logout
    click_link I18n.t('system.links.logout')
    expect(page).not_to have_text(last_user.name)
  end

  def last_user
    User.last
  end

  def switch_to_subdomain(subdomain)
    # resolve subdomain to 127.0.0.1
    subdomain = subdomain ? "#{subdomain}.#{domain}" : "www.#{domain}"
    Capybara.app_host = "http://#{subdomain}"
    Capybara.app_host
  end

  def switch_to_main_domain
    switch_to_subdomain nil
  end

  def create_dependencies
    state
    store_category
  end

  def click_submit_button
    click_button I18n.t('system.links.save')
  end

  def create_store
    within('#new_store') do
      fill_in 'store[name]', with: 'My Store'
      fill_in 'store[slug]', with: 'my-store'
      select state.name, from: 'store[state_id]'
      select store_category.name, from: 'store[category_id]'
      fill_in 'store[address]', with: 'Some Addresss'
      fill_in 'store[phone]', with: '(51) 3535-5555'
      fill_in 'store[email]', with: Faker::Internet.email
      click_submit_button
    end

    # for is invalid, missing cities
    within('#new_store') do
      select city.name, from: 'store[city_id]'
      click_submit_button
    end

    expect(page).to have_text(I18n.t('managers.stores.create.success'))
  end

end

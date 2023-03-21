require "rails_helper"
require "active_record"
require "bullet"

RSpec.feature "user can successfully log in" do
  before do
    create(:school)
    @user = create(:user)
  end

  scenario "they can visit and see the homepage" do
    visit root_path

    expect(page).to have_content('Learn Science Without Sacrificing on 21st Century Skills')
  end

  scenario "they can log in" do
    visit root_path
    click_on 'Login'

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_on 'Log in'

    expect(page).to have_content('Signed in successfully')
  end

  scenario "users can't log in without the right password" do
    visit root_path
    click_on 'Login'

    fill_in "Email", with: @user.email
    fill_in "Password", with: 'qwerty'
    click_on 'Log in'

    expect(page).to have_content('Invalid Email or password')
  end
end

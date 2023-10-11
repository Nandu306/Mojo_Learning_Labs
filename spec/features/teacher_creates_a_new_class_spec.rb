require "rails_helper"
require "active_record"
require "bullet"

RSpec.feature "teacher creates a new class" do
  before do
    create(:school)
    @user_1 = create(:user, role: 'teacher')
    @user_2 = create(:user, name: "John Doe")
    login_as(@user_1)
  end

  scenario "they can create and see a new class on their dashboard" do
    visit dashboard_path
    click_on "Create a class"
    # within("#new_taught_class") do
      fill_in "Year", with: "Year 2"
      fill_in "Subject", with: "Science"
      fill_in "Academic year", with: "2022/2023"
      click_on "commit"
    # end

    expect(page).to have_content('Welcome, Jane Doe')
    expect(page).to have_content('Year 2')
    expect(TaughtClass.count).to eq(1)
    expect(TaughtClass.last.subject).to eq('Science')
  end

  scenario "they can only see classes that they have created" do
    visit dashboard_path

    create(:taught_class, user: @user_1)

    expect(@user_1.taught_classes.count).to eq(1)

    login_as(@user_2)
    visit dashboard_path

    expect(@user_2.taught_classes.count).to eq(0)
  end

  scenario "invalid class input" do
    visit dashboard_path
    click_on "Create a class"
    fill_in "Year", with: ""
    click_on "commit"

    expect(page).to have_content("Year can't be blank")
  end
end

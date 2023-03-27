require "rails_helper"
require "active_record"
require "bullet"

RSpec.feature "teacher sets new assignment", js: true do
  before do
    create(:school)
    @user_1 = create(:user, role: 'teacher')
    login_as(@user_1)
    create(:taught_class, user: @user_1)

    # Capybara.default_driver = :selenium
  end

  scenario "they can set a new assignment" do
    visit dashboard_path
    click_on "Set an assignment"
    fill_in "Topic", with: "Chemistry"
    find_by_id('addquestion').click
    click_on "Set assignment"

    expect(page).to have_content('Chemistry')
    expect(Assignment.count).to eq(1)
    expect(Assignment.last.topic).to eq('Chemistry')
    expect(Assignment.last.taught_class.subject).to eq('Science')
  end

  scenario "invalid assignment input" do
    visit dashboard_path
    click_on "Set an assignment"
    fill_in "Topic", with: ""
    find_by_id('addquestion').click
    fill_in 'Question prompt:', with: "how?"
    fill_in 'Correct answer:', with: "yes!"
    click_on "Set assignment"

    expect(page).to have_content("Topic can't be blank")
  end
end

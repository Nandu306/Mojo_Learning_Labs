require "rails_helper"
require "active_record"
require "bullet"

RSpec.feature "teacher creates a new class" do
  before do
    school = School.new(name: 'School')
    @user = User.create(name: 'Jane Doe', email: 'jane@email.com', password: 'password', role: 'teacher', school: school)
    @user_2 = User.create(name: 'John Doe', email: 'john@email.com', password: 'password', role: 'teacher', school: school)
    login_as(@user)
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

    TaughtClass.create(year: 'Year 2', subject: 'Science', academic_year: "2022/2023", user: @user)

    expect(@user.taught_classes.count).to eq(1)

    login_as(@user_2)
    visit dashboard_path

    expect(@user_2.taught_classes.count).to eq(0)
  end

  scenario "they can set a new assignment" do
    TaughtClass.create(year: 'Year 2', subject: 'Science', academic_year: "2022/2023", user: @user)
    visit dashboard_path
    click_on "Set an assignment"
    fill_in "Topic", with: "Chemistry"
    find_by_id('addquestion').click
    # prompt = page.find_by_id("#question")
    # prompt.set("How are you?")
    click_on "Set assignment"

    expect(page).to have_content('Chemistry')
    expect(Assignment.count).to eq(1)
    expect(Assignment.last.topic).to eq('Chemistry')
    expect(Assignment.last.taught_class.subject).to eq('Science')
  end
end

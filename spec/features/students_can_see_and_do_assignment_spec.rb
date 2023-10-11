require "rails_helper"
require "active_record"
require "bullet"

RSpec.feature "student can see and do assignments" do
  before do
    create(:school)
    @user_1 = create(:user, role: 'teacher')
    @student = create(:user, role: 'student')
    @class = create(:taught_class, user: @user_1)
    @class_membership = create(:class_membership, user: @student, taught_class: @class)
    @assignment = create(:assignment, taught_class: @class, deadline: DateTime.new(2030,9,3,0,0,0))
    @question = create(:question, assignment: @assignment)
    @option_one = create(:option, question: @question)
    @option_two = create(:option, content: 'Eyes', question: @question)
    login_as @student
  end

  scenario "they can visit and see assignments on the dashboard" do
    visit dashboard_path

    expect(page).to have_content('Assignments set')
    expect(@student.total_number_of_assignments_given).to eq(1)
  end

  scenario "they can complete set assignments" do
    visit dashboard_path

    click_on 'Complete assignment'
    expect(page).to have_content('What organ is responsible for respiration in mammals?')
    choose('Lungs')
    click_on('Submit')
    expect(page).to have_content('Your score:')
    expect(page).to have_content('The correct answer is:')

    visit dashboard_path
    expect(page).to have_content('View result')
    click_on 'View result'
  end
end

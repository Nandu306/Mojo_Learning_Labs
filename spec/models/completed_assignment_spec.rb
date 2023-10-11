require "rails_helper"
require "active_record"
require "bullet"

RSpec.describe CompletedAssignment, "#score" do
  before do
    create(:school)
    @user_1 = create(:user, role: 'teacher')
    @student = create(:user, role: 'student')
    @class = create(:taught_class, user: @user_1)
    @class_membership = create(:class_membership, user: @student, taught_class: @class)
    @assignment = create(:assignment, taught_class: @class)
    @question = create(:question, assignment: @assignment)
    @option_one = create(:option, question: @question)
    @option_two = create(:option, content: 'Eyes', question: @question)
    @completed_assignment = create(:completed_assignment, user: @student, assignment: @assignment)
    @student_answer = create(:student_answer, completed_assignment: @completed_assignment, question: @question, option: @option_one)
  end

  it "calculates assignment score" do
    @completed_assignment.score

    expect(@completed_assignment.score).to eq 100
  end
end

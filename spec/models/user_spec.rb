require "rails_helper"
require "active_record"
require "bullet"

RSpec.describe User do
  before do
    create(:school)
    @user_1 = create(:user)
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

  describe "#total_number_of_assignments_given" do
    it "calculates the number of assignments a student has" do
      @student.total_number_of_assignments_given

      expect(@student.total_number_of_assignments_given).to eq 1
    end
  end

  describe "#number_of_assignments_still_to_complete" do
    it "assigns a student role to a user when they sign up" do
      @student.number_of_assignments_still_to_complete

      expect(@student.number_of_assignments_still_to_complete).to eq 0
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end

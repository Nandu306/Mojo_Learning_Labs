require "rails_helper"
require "active_record"
require "bullet"

RSpec.describe Assignment do
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

  describe "#class_average" do
    it "calculates class average" do
      @assignment.class_average

      expect(@assignment.class_average).to eq 100
    end
  end

  describe "#student_percentage_completed" do
    it "calculates how many have completed the assignment" do
      @assignment.student_percentage_completed

      expect(@assignment.student_percentage_completed).to eq("100%")
    end
  end

  describe "validations" do
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:deadline) }
  end
end

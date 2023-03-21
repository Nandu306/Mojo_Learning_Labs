require "rails_helper"
require "active_record"
require "bullet"

RSpec.describe Assignment do
  before do
    create(:school)
    @user_1 = create(:user)
    @student = create(:user, role: 'student')
    @class = create(:taught_class, user: @user_1)
    @class_membership = create(:class_membership, user: @student, taught_class: @class)
    @assignment = create(:assignment, taught_class: @class)


    @question = Question.create(prompt: 'What organ is responsible for respiration in mammals?', answer: 'Lungs', assignment: @assignment)
    @option_one = Option.create(content: 'Lungs', question: @question)
    @option_two = Option.create(content: 'Eyes', question: @question)
    @completed_assignment = CompletedAssignment.create(user: @student, assignment: @assignment)
    @student_answer = StudentAnswer.create(completed_assignment: @completed_assignment, question: @question, option: @option_one)
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

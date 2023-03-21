require "rails_helper"
require "active_record"
require "bullet"

RSpec.describe CompletedAssignment, "#score" do
  before do
    school = School.new(name: 'School')
    @user = User.create(name: 'Jane Doe', email: 'jane@email.com', password: 'password', role: 'teacher', school: school)
    @student = User.create(name: 'Pierre Smith', email: 'pierre@email.com', password: 'password', role: 'student', school: school)
    @bio_class = TaughtClass.create(year: 'Year 2', subject: 'Science', academic_year: "2022/2023", user: @user)
    @assignment = Assignment.create(topic: 'Respiration', note: "Please refer to pages 120-145 of your textbook", deadline: DateTime.new(2021,9,3,0,0,0), taught_class: @bio_class)
    @question = Question.create(prompt: 'What organ is responsible for respiration in mammals?', answer: 'Lungs', assignment: @assignment)
    @option_one = Option.create(content: 'Lungs', question: @question)
    @option_two = Option.create(content: 'Eyes', question: @question)
    @completed_assignment = CompletedAssignment.create(user: @student, assignment: @assignment)
    @student_answer = StudentAnswer.create(completed_assignment: @completed_assignment, question: @question, option: @option_one)
  end

  it "calculates assignment score" do
    @completed_assignment.score

    expect(@completed_assignment.score).to eq 100
  end
end

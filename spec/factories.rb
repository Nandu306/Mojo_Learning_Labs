FactoryBot.define do
  factory :school do
    name { 'School'}
  end

  factory :user do
    name { 'Jane Doe'}
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password { 'password' }
    school factory: :school
  end

  factory :taught_class do
    year { 'Year 2' }
    subject { 'Science' }
    academic_year { "2022/2023" }
    user factory: :user
  end

  factory :class_membership do
    user factory: :user
    taught_class factory: :taught_class
  end

  factory :assignment do
    topic { 'Respiration' }
    note { 'Please refer to pages 120-145 of your textbook' }
    deadline { DateTime.new(2021,9,3,0,0,0) }
    taught_class factory: :taught_class
  end

  factory :question do
    prompt { 'What organ is responsible for respiration in mammals?' }
    answer { 'Lungs' }
    assignment factory: :assignment
  end

  factory :option do
    content { 'Lungs' }
    question factory: :question
  end

  factory :completed_assignment do
    user factory: :user
    assignment factory: :assignment
  end

  factory :student_answer do
    question factory: :question
    completed_assignment factory: :completed_assignment
    option factory: :option
  end
end

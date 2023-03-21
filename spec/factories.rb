FactoryBot.define do
  factory :school do
    name { 'School'}
  end

  factory :user do
    name { 'Jane Doe'}
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password { 'password' }
    role { 'teacher'}
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
end

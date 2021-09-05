# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Preparing to seed data..."

Question.destroy_all
Assignment.destroy_all
TaughtClass.destroy_all
User.destroy_all



# Users

Mary = User.find_or_initialize_by(name: 'Mary Smith', email: 'mary@gmail.com', role: 'teacher')
Mary.password = 'qwerty'
Mary.save

Peter = User.find_or_initialize_by(name: 'Peter Silva', email: 'peter@gmail.com', role: 'teacher')
Peter.password = 'qwerty'
Peter.save

Sarah = User.find_or_initialize_by(name: 'Sarah Williams', email: 'sarah@gmail.com', role: 'student')
Sarah.password = 'qwerty'
Sarah.save

Pierre = User.find_or_initialize_by(name: 'Pierre Blanc', email: 'pierre@gmail.com', role: 'student')
Pierre.password = 'qwerty'
Pierre.save

Chen = User.find_or_initialize_by(name: 'Chen Wu', email: 'chen@gmail.com', role: 'student')
Chen.password = 'qwerty'
Chen.save


# Taught Classes


Biology = TaughtClass.find_or_initialize_by(year: 'Year 7', subject: 'Biology', students: [Pierre, Chen, Sarah], academic_year: '2021/2022', user: Mary)
Biology.save

Physics = TaughtClass.find_or_initialize_by(year: 'Year 7', subject: 'Physics', students: [Pierre, Chen], academic_year: '2021/2022', user: Peter)
Physics.save

Chemistry = TaughtClass.find_or_initialize_by(year: 'Year 7', subject: 'Chemistry', students: [Sarah, Chen], academic_year: '2021/2022', user: Peter)
Chemistry.save


# Assignments


Respiration = Assignment.find_or_initialize_by(topic: 'Respiration', status: 'completed', deadline: DateTime.new(2021,9,3,0,0,0), taught_class: Biology)
Respiration.save

Reactions = Assignment.find_or_initialize_by(topic: 'Reactions', status: 'completed', deadline: DateTime.new(2021,9,5,0,0,0), taught_class: Chemistry)
Reactions.save

Forces = Assignment.find_or_initialize_by(topic: 'Forces', status: 'completed', deadline: DateTime.new(2021,9,5,0,0,0), taught_class: Physics)
Forces.save


# Questions

Question_One = Question.find_or_initialize_by(prompt: 'What organ is responsible for respiration in mammals?', option_1: 'Heart', option_2: 'Eyes', option_3: 'Brain', option_4: 'Lungs', answer: 'Lungs', assignment: Respiration)
Question_One.save


Question_Two = Question.find_or_initialize_by(prompt: 'Which is responsible for the green colour of leaves?', option_1: 'Mitochondria', option_2: 'Ribosomes', option_3: 'Chorophyll', option_4: 'Xylem', answer: 'Chorophyll', assignment: Respiration)
Question_Two.save

Question_Three = Question.find_or_initialize_by(prompt: 'Which two variables have an effect on force?', option_1: 'Mass and Acceleration', option_2: 'Weight and Speed', option_3: 'Mass and Speed', option_4: 'Weight and Acceleration', answer: 'Mass and Acceleration', assignment: Forces)
Question_Three.save

Question_Four = Question.find_or_initialize_by(prompt: 'What is the negative particle in an atom?', option_1: 'Protons', option_2: 'Electrons', option_3: 'Neutrons', option_4: 'Molecules', answer: 'Electrons', assignment: Reactions)
Question_Four.save

Question_Five = Question.find_or_initialize_by(prompt: 'What is the weight of a ball of mass 1 kg?', option_1: '20N', option_2: '10N', option_3: '15N', option_4: '1N', answer: '10N', assignment: Forces)
Question_Five.save


puts "Finished seeding"









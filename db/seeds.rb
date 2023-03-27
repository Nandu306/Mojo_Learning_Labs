# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Preparing to seed data..."

StudentAnswer.destroy_all
Option.destroy_all
CompletedAssignment.destroy_all
Question.destroy_all
Assignment.destroy_all
ClassMembership.destroy_all
TaughtClass.destroy_all
User.destroy_all
School.destroy_all



# Schools

Best = School.find_or_initialize_by(name: 'Best School', address: '123 Lane', country: 'UK')
Best.save

Second_Best = School.find_or_initialize_by(name: 'Second Best School', address: '125 Lane', country: 'UK')
Second_Best.save



# Users

Mary = User.find_or_initialize_by(name: 'Mary Smith', email: 'mary@gmail.com', role: 'teacher', school: Best)
Mary.password = 'qwerty'
Mary.save

Peter = User.find_or_initialize_by(name: 'Peter Silva', email: 'peter@gmail.com', role: 'teacher', school: Best)
Peter.password = 'qwerty'
Peter.save

Sarah = User.find_or_initialize_by(name: 'Sarah Williams', email: 'sarah@gmail.com', role: 'student', year: 'Year 7', school: Second_Best)
Sarah.password = 'qwerty'
Sarah.save

Pierre = User.find_or_initialize_by(name: 'Pierre Blanc', email: 'pierre@gmail.com', role: 'student', year: 'Year 7', school: Best)
Pierre.password = 'qwerty'
Pierre.save

Chen = User.find_or_initialize_by(name: 'Chen Wu', email: 'chen@gmail.com', role: 'student', year: 'Year 7', school: Best)
Chen.password = 'qwerty'
Chen.save

Kumar = User.find_or_initialize_by(name: 'Kumar Das', email: 'kumar@gmail.com', role: 'teacher', school: Second_Best)
Kumar.password = 'qwerty'
Kumar.save




# Taught Classes


Biology = TaughtClass.find_or_initialize_by(year: 'Year 7', subject: 'Biology', academic_year: '2021/2022', user: Mary)
Biology.save

Science = TaughtClass.find_or_initialize_by(year: 'Year 6', subject: 'Science', academic_year: '2021/2022', user: Mary)
Science.save

Physics = TaughtClass.find_or_initialize_by(year: 'Year 7', subject: 'Physics', academic_year: '2021/2022', user: Peter)
Physics.save

Chemistry = TaughtClass.find_or_initialize_by(year: 'Year 7', subject: 'Chemistry', academic_year: '2021/2022', user: Peter)
Chemistry.save

Biology1 = TaughtClass.find_or_initialize_by(year: 'Year 7', subject: 'Biology', academic_year: '2021/2022', user: Kumar)
Biology1.save


# Class Memberships

Pierre_Bio = ClassMembership.find_or_initialize_by(taught_class: Biology, user: Pierre )
Pierre_Bio.save

Chen_Bio = ClassMembership.find_or_initialize_by(taught_class: Biology, user: Chen )
Chen_Bio.save

Pierre_Phys = ClassMembership.find_or_initialize_by(taught_class: Physics, user: Pierre )
Pierre_Phys.save


# Assignments


Respiration = Assignment.find_or_initialize_by(topic: 'Respiration', note: "Please refer to pages 120-145 of your textbook", deadline: DateTime.new(2021,9,3,0,0,0), taught_class: Biology)
Respiration.save

Reactions = Assignment.find_or_initialize_by(topic: 'Reactions', note: "Please refer to pages 120-145 of your textbook", deadline: DateTime.new(2021,9,5,0,0,0), taught_class: Chemistry)
Reactions.save

Forces = Assignment.find_or_initialize_by(topic: 'Forces', note: "Please refer to pages 120-145 of your textbook", deadline: DateTime.new(2029,9,5,0,0,0), taught_class: Physics)
Forces.save


# Questions

Question_One = Question.find_or_initialize_by(prompt: 'What organ is responsible for respiration in mammals?', answer: 'Lungs', assignment: Respiration)
Question_One.save


Question_Two = Question.find_or_initialize_by(prompt: 'Which is responsible for the green colour of leaves?', answer: 'Chorophyll', assignment: Respiration)
Question_Two.save

Question_Three = Question.find_or_initialize_by(prompt: 'Which two variables have an effect on force?', answer: 'Mass and Acceleration', assignment: Forces)
Question_Three.save

Question_Four = Question.find_or_initialize_by(prompt: 'What is the negative particle in an atom?', answer: 'Electrons', assignment: Reactions)
Question_Four.save

Question_Five = Question.find_or_initialize_by(prompt: 'What is the weight of a ball of mass 1 kg?', answer: '10N', assignment: Forces)
Question_Five.save


# Options

Option_One = Option.find_or_initialize_by(content: 'Heart', question: Question_One)
Option_One.save

Option_Two = Option.find_or_initialize_by(content:'Eyes', question: Question_One)
Option_Two.save

Option_Three = Option.find_or_initialize_by(content:'Brain', question: Question_One)
Option_Three.save

Option_Four = Option.find_or_initialize_by(content:'Lungs', question: Question_One)
Option_Four.save


Second_Option_One = Option.find_or_initialize_by(content: 'Mitochondria', question: Question_Two)
Second_Option_One.save

Second_Option_Two = Option.find_or_initialize_by(content:'Ribosomes', question: Question_Two)
Second_Option_Two.save

Second_Option_Three = Option.find_or_initialize_by(content:'Chorophyll', question: Question_Two)
Second_Option_Three.save

Second_Option_Four = Option.find_or_initialize_by(content:'Xylem', question: Question_Two)
Second_Option_Four.save


Third_Option_One = Option.find_or_initialize_by(content: 'Mass and acceleration', question: Question_Three)
Third_Option_One.save

Third_Option_Two = Option.find_or_initialize_by(content:'Weight and speed', question: Question_Three)
Third_Option_Two.save

Third_Option_Three = Option.find_or_initialize_by(content:'Mass and speed', question: Question_Three)
Third_Option_Three.save

Third_Option_Four = Option.find_or_initialize_by(content:'Weight and acceleration', question: Question_Three)
Third_Option_Four.save


Fourth_Option_One = Option.find_or_initialize_by(content: 'Protons', question: Question_Four)
Fourth_Option_One.save

Fourth_Option_Two = Option.find_or_initialize_by(content:'Electrons', question: Question_Four)
Fourth_Option_Two.save

Fourth_Option_Three = Option.find_or_initialize_by(content:'Neutrons', question: Question_Four)
Fourth_Option_Three.save

Fourth_Option_Four = Option.find_or_initialize_by(content:'Molecules', question: Question_Four)
Fourth_Option_Four.save


Fifth_Option_One = Option.find_or_initialize_by(content: '20N', question: Question_Five)
Fifth_Option_One.save

Fifth_Option_Two = Option.find_or_initialize_by(content:'10N', question: Question_Five)
Fifth_Option_Two.save

Fifth_Option_Three = Option.find_or_initialize_by(content:'15N', question: Question_Five)
Fifth_Option_Three.save

Fifth_Option_Four = Option.find_or_initialize_by(content:'1N', question: Question_Five)
Fifth_Option_Four.save



# Completed Assignments

First_Assignment = CompletedAssignment.find_or_initialize_by(user: Pierre, assignment: Respiration)
First_Assignment.save


# Student Answers

Pierre_Ans = StudentAnswer.find_or_initialize_by(completed_assignment: First_Assignment, question: Question_One, option: Option_One)
Pierre_Ans.save

Pierre_Ans2 = StudentAnswer.find_or_initialize_by(completed_assignment: First_Assignment, question: Question_Two, option: Second_Option_Three)
Pierre_Ans2.save


puts "Finished seeding"









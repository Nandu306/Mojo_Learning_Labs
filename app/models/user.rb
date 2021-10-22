class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :taught_classes, dependent: :destroy
  has_many :assignments, through: :taught_classes, source: :assignments
  has_many :class_memberships, dependent: :destroy
  has_many :student_answers, through: :completed_assignments
  has_many :completed_assignments

  belongs_to :school


  enum role: [:teacher, :student, :admin]
  after_initialize :set_default_role, :if => :new_record?

  scope :students, -> { where role: "student" }
  scope :teachers, -> { where role: "teacher" }



  validates :name, presence: true
  # validates :role, presence: true

  SCHOOLS = ['Best School', 'Second Best School']

  def set_default_role
    self.role ||= :student
  end

  def total_number_of_assignments_given
    assignments = 0
    self.class_memberships.each do |class_membership|
      assignments += class_membership.taught_class.assignments.size
    end

    p assignments
  end


  def number_of_assignments_still_to_complete
    number = 0

    self.class_memberships.includes(:taught_class).each do |class_membership|
      if class_membership.taught_class.assignments.any?
         class_membership.taught_class.assignments.each do |assignment|
           number += (class_membership.taught_class.assignments.size - assignment.completed_assignments.size)
         end
      end
    end

    p number
  end


  # def first_deadline

  #   sorted_array = []

  #   self.class_memberships.includes(:taught_class).each do |class_membership|
  #     if class_membership.taught_class.assignments.any?
  #        sorted_array = class_membership.taught_class.assignments.sort_by { |assignment| assignment.deadline }.reverse
  #        p sorted_array[0]
  #     end

  #   end
  # end

end

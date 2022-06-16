class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable,
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable, invite_for: 2.weeks

  # constants

  SCHOOLS = ['Best School', 'Second Best School']

  # enums

  enum role: { teacher: 0, student: 1, admin: 2 }

  # associations

  has_many :taught_classes, dependent: :destroy
  has_many :assignments, through: :taught_classes
  has_many :class_memberships, dependent: :destroy
  has_many :student_answers, through: :completed_assignments
  has_many :completed_assignments

  belongs_to :school

  accepts_nested_attributes_for :school

  # validations

  validates :name, presence: true
  # validates :role, presence: true

  # callbacks

  after_initialize :set_default_role, :if => :new_record?

  def total_number_of_assignments_given
    # assignments = 0
    # class_memberships.includes(:taught_class).each do |class_membership|
    #   assignments += class_membership.taught_class.assignments.size
    # end

    class_memberships.includes(:taught_class).sum do |class_membership|
      class_membership.taught_class.assignments.size
    end
  end

  def number_of_assignments_still_to_complete
    total_assignments = total_number_of_assignments_given

    assignments_completed = completed_assignments.size

    total_assignments - assignments_completed
  end

  private

  def set_default_role
    self.role ||= :student
  end

  def with_school
    build_school if school.nil?
    self
  end
end

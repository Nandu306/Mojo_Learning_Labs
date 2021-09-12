class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :taught_classes, dependent: :destroy
  has_many :assignments, through: :taught_classes, source: :assignments
  has_many :class_memberships, dependent: :destroy


  enum role: [:teacher, :student, :admin]
  after_initialize :set_default_role, :if => :new_record?

  scope :students, -> { where role: "student" }
  scope :teachers, -> { where role: "teacher" }



  validates :name, presence: true
  # validates :role, presence: true

  def set_default_role
    self.role ||= :student
  end

end

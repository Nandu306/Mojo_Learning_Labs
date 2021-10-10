class AssignmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.teacher?
  end

  def publish?
    user.teacher?
  end

  def show?
    user.teacher?
  end

  def update?
    user.teacher?
  end

  def edit?
    user.teacher?
  end

  def create_completed_assignment?
    user.student?
  end

  def show_completed_assignment?
    user.student?
  end

  def class_performance?
    user.teacher?
  end

  def my_assignments?
    user.student?
  end

end

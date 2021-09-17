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
    user.teacher? || user.student?
  end

end

class ClassMembershipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
        scope.all
    end
  end

  def create?
    user.student?
  end

  def index?
    user.student?
  end

  def my_assignments?
    user.student?
  end
end

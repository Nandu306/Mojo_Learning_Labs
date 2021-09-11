class TaughtclassPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index
  #   current_user.teacher?
  # end

  def create
    current_user.teacher?
  end

end

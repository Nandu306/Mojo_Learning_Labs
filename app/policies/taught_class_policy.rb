class TaughtClassPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index
  #   record.user == user
  # end

  def create?
    user.teacher?
  end

end

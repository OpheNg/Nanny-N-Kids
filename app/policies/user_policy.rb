class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

  end

  def dashboarddd?
    record == user
  end 

  def dashboard?
    record == user
  end 

end

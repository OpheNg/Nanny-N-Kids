class BookingPolicy < ApplicationPolicy
  # class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

  # end

  def new?
    return true
  end

  def create?
    true
  end

  def show?
    record.user == user
  end

  def edit?
    record.user == user
  end 

  def update?
    true
  end 

  def destroy?
    record.user == user
  end
  

end

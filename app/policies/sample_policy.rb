class SamplePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    tecnician_or_admin? == false
  end

  def show?
    if tecnician_or_admin?
      true
    else
      record.user == user
    end
  end

  def destroy?
    if tecnician_or_admin?
      false
    else
      record.user == user
    end
  end

  def edit?
    update?
  end

  def update?
    tecnician_or_admin? == false
  end
  
  private

  def tecnician_or_admin?
    user.tecnician || user.admin
  end
end

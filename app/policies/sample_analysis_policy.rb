class SampleAnalysisPolicy < ApplicationPolicy
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

  private

  def tecnician_or_admin?
    user.tecnician || user.admin
  end
end

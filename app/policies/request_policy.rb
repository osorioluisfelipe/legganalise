class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.tecnician || user.admin
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    # Apenas usuários que criaram a request ou admin/tecnician podem ver requests
    true
  end

  def new?
    # Chama o método 'create?'. Se pode 'create' então pode fazer 'new'
    create?
  end

  def create?
    # Apenas usuários podem criar novas requests
    tecnician_or_admin? == false
  end

  def destroy?
    # Apenas usuários podem deletar suas próprias requests
    if tecnician_or_admin?
      false
    else
      record.user == user
    end
  end

  def upload?
    # Apenas tecnician pode fazer o upload de arquivos
    user.tecnician
  end

  def update?
    # Só o tecnician não faz update de request
    user.tecnician == false
  end

  private

  def tecnician_or_admin?
    user.tecnician || user.admin
  end
end

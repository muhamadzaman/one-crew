class JobPolicy < ApplicationPolicy
  def create?
    @user.admin? || @user.client?
  end

  def update?
    @record.user == @record || @user.admin?
  end

  def destroy?
    update?
  end
end
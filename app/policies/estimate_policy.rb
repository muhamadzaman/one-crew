class EstimatePolicy < ApplicationPolicy
  def create?
    @user.contractor?
  end

  def update?
    @record.user === @user || @user.admin?
  end

  def destroy?
    update?
  end
end
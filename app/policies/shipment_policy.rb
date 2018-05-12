class ShipmentPolicy < ApplicationPolicy
  def create?
    user == record.shop.user
  end

  def destroy?
    user == record.shop.user
  end

  def edit?
    user == record.shop.user
  end
end

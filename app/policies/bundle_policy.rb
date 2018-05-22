class BundlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def mybundles?
    true
  end

  def show?
    true
  end

  def show_review?
    record.bookings.user == user
  end

  def create?
    user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end

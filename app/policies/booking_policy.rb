class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.select { |booking| booking.bundle.user == user }
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def deny?
    true
  end

  def approve?
    true
  end

end

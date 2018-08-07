class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end
  def new?
    create?
  end
   # def edit?
  #   update?
  # end
   # def update?
  #   is_user?
  # end
   # def destroy?
  #   is_user?
  # end
end

class UsersLoyalty < ApplicationLoyalty
  def create?
    user.admin?
  end
end

class ReportsLoyalty < ApplicationLoyalty
  def create?
    user.id == record.user_id
  end
end

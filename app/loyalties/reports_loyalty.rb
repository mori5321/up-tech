class ReportsLoyalty < ApplicationLoyalty
  def new?
    user.id == record.user_id
  end
end

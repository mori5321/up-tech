class ReportsLoyalty < ApplicationLoyalty
  def create?
    record.task.user.superior_id = current_user.id
  end
end

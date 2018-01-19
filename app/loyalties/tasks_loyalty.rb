class TasksLoyalty < ApplicationLoyalty
  def show?
    record.user_id == user.id
  end
end

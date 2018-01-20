class CommentsLoyalty < ApplicationLoyalty
  def create?
    user.manager? || user.admin?
  end
end

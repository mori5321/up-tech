class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :tasks
  has_many :comments
  has_many :subordinate_users, class_name: 'User', foreign_key: :superior_id
  belongs_to :superior_user, class_name: 'User', foreign_key: :superior_id, optional: true

  enum role: {
    guest: 0,
    manager: 1,
    admin: 2,
  }

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :crypted_password, presence: true
  validates :salt, presence: true

  #TODO: need to test this method.
  def subordinate_users_report_to_be_checked
    subordinates_ids = subordinate_users.ids
    Report.eager_load(:task).where("checked= ? and tasks.user_id IN (?)", false, subordinates_ids)
  end
end

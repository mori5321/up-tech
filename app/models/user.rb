class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :tasks
  has_many :comments

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

end

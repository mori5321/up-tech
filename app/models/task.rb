class Task < ApplicationRecord
  belongs_to :user

  enum kind: {
    daily: 0,
    weekly: 1,
    monthly: 2
  }
end

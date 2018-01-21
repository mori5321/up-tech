class Stamp < ApplicationRecord
  belongs_to :user
  belongs_to :report

  enum kind: { like: 0, potential: 1 }
end

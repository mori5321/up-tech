class Report < ApplicationRecord
  attr_accessor :kind
  attr_accessor :month, :week, :date, :start_time, :finish_time

  include DateTimeConvertable
end

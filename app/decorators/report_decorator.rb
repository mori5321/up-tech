class ReportDecorator < ApplicationDecorator
  delegate_all

  include TimeStampDecoratable
end

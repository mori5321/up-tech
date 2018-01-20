class TaskDecorator < ApplicationDecorator
  delegate_all

  def slashed_start_datetime
    start_datetime.strftime("%m/%d %H:%M")
  end

  def slashed_finish_datetime
    finish_datetime.strftime("%m/%d %H:%M")
  end
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end

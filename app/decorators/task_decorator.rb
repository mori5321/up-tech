class TaskDecorator < ApplicationDecorator
  delegate_all

  def start_datetime
    start_datetime.in_time_zone('Tokyo')
  end
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end

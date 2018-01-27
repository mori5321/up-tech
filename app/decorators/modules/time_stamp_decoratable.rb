module TimeStampDecoratable
  def start_to_finish
    japanese_start_datetime + " ~ " + japanse_finish_datetime
  end

  def start_time_to_finish_time
    formatted_start_time + " ~ " + formatted_finish_time
  end

  def japanese_start_datetime
    start_datetime.strftime("%m月%d日 %H:%M")
  end

  def japanse_finish_datetime
    finish_datetime.strftime("%m月%d日 %H:%M")
  end

  def formatted_start_time
    start_datetime.strftime("%H:%M")
  end

  def formatted_finish_time
    finish_datetime.strftime("%H:%M")
  end

  def slashed_start_datetime
    start_datetime.strftime("%m/%d %H:%M")
  end

  def slashed_finish_datetime
    finish_datetime.strftime("%m/%d %H:%M")
  end
end
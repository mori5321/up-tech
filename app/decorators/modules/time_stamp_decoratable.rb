module TimeStampDecoratable
  def start_to_finish
    japanese_start_datetime + " ~ " + japanse_finish_datetime
  end

  def japanese_start_datetime
    start_datetime.strftime("%m月%d日 %H:%M")
  end

  def japanse_finish_datetime
    finish_datetime.strftime("%m月%d日 %H:%M")
  end

  def japanese_finish_datetime
  end

  def slashed_start_datetime
    start_datetime.strftime("%m/%d %H:%M")
  end

  def slashed_finish_datetime
    finish_datetime.strftime("%m/%d %H:%M")
  end
end
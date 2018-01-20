module TimeStampDecoratable
  def slashed_start_datetime
    start_datetime.strftime("%m/%d %H:%M")
  end

  def slashed_finish_datetime
    finish_datetime.strftime("%m/%d %H:%M")
  end
end
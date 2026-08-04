module ApplicationHelper
  def json_data(value)
    raw(json_escape(value.to_json))
  end

  def formatted_datetime(time)
    time.strftime("%Y/%m/%d %H:%M")
  end

  def number_compact(number)
    number_with_delimiter(number)
  end

end

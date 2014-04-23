module ApplicationHelper
  def pretty_date(date)
    date.strftime("%B %d, %Y")
  end

  def pretty_date_time(date)
    date.strftime("%B %d, Y at %I:%M %p")
  end
  
  def duration_to_hours(duration)
    duration / 60
  end
end

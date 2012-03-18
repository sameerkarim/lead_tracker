module ContactActivitiesHelper
  
  def custom_time_ago_in_words(time_str)
    time = time_str.to_time + (-Time.zone_offset(Time.now.zone))
    "#{time_ago_in_words(time)} ago"
  end
end

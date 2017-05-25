module WebConditions

  # @method waiting(time_in_secs)
  # @param time_in_secs [Fixnum] -- Maximum amount of time a condition needs to wait
  # @return [object of WebDriver::Wait class]

  def waiting(time_in_secs)
    Selenium::WebDriver::Wait.new(:timeout => time_in_secs.to_i)
  end

end
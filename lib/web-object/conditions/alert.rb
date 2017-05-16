module WebConditions

  def alert_present?
    @driver.switch_to.alert
    true
  rescue
    false
  end

end #module WebConditions
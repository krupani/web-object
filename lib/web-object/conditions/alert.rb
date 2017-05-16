module ExpectedConditions

  def alert_present?
    @driver.switch_to.alert
    true
  rescue Exception => e
    false
  end

end #module ExpectedConditions
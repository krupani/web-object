module WebConditions

  # @method alert_present?
  # @return [Boolean true] -- if alert is present on page
  # @return [Boolean false] -- if alert is absent from page

  def alert_present?
    @driver.switch_to.alert
    true
  rescue
    false
  end

end #module WebConditions
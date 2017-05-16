module ExpectedConditions

  def element_is_clickable(ele)
    element = element_or_locator(ele)
    if element_is_visible(element) and element_is_enabled(element)
      true
    else
      false
    end
  end

  def element_is_enabled(ele)
    element = element_or_locator(ele)
    if element.enabled?
      true
    else
      false
    end
  end

  def element_is_disabled(ele)
    element = element_or_locator(ele)
    if element.enabled?
      false
    else
      true
    end
  end

  def element_is_visible(ele)
    element = element_or_locator(ele)
    if element.displayed?
      true
    else
      false
    end
  end

  def element_is_invisible(ele)
    element = element_or_locator(ele)
    if element.displayed?
      false
    else
      true
    end
  end

  def element_is_present(locator)
    begin
      @driver.find_element(locator)
      true
    rescue
      false
    end
  end

  def element_is_absent(locator)
    begin
      @driver.find_element(locator)
      false
    rescue
      true
    end
  end

  @private
  def element_or_locator(ele)
    if ele.class == Hash
      begin
        @driver.find_element(ele)
      rescue
        raise 'Looks like the element itself is not present on the page, Please wait for element to be present'
      end
    else
      ele
    end
  end

end #module ExpectedConditions
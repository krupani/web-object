module WebConditions

  # @method element_is_clickable(ele)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @return [Boolean true] -- if element is clickable(visible and enabled) on page
  # @return [Boolean false] -- if element is not clickable(visible and enabled) on page

  def element_is_clickable(ele)
    element = element_or_locator(ele)
    if element_is_visible(element) and element_is_enabled(element)
      true
    else
      false
    end
  end


  # @method element_is_enabled(ele)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @return [Boolean true] -- if element is enabled on page
  # @return [Boolean false] -- if element is disabled on page

  def element_is_enabled(ele)
    element = element_or_locator(ele)
    if element.enabled?
      true
    else
      false
    end
  end


  # @method element_is_disabled(ele)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @return [Boolean true] -- if element is disabled on page
  # @return [Boolean false] -- if element is enabled on page

  def element_is_disabled(ele)
    element = element_or_locator(ele)
    if element.enabled?
      false
    else
      true
    end
  end


  # @method element_is_visible(ele)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @return [Boolean true] -- if element is visible on page
  # @return [Boolean false] -- if element is invisible / hidden on page

  def element_is_visible(ele)
    element = element_or_locator(ele)
    if element.displayed?
      true
    else
      false
    end
  end


  # @method element_is_invisible(ele)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @return [Boolean true] -- if element is invisible / hidden on page
  # @return [Boolean false] -- if element is visible on page

  def element_is_invisible(ele)
    element = element_or_locator(ele)
    if element.displayed?
      false
    else
      true
    end
  end


  # @method element_is_present(ele)
  # @param locator [locator Hash] -- eg {:id => 'some_id'}]
  # @return [Boolean true] -- if element is present in DOM of page
  # @return [Boolean false] -- if element is absent from DOM of page

  def element_is_present(locator)
    begin
      @driver.find_element(locator)
      true
    rescue
      false
    end
  end

  # @method element_is_absent(ele)
  # @param locator [locator Hash] -- eg {:id => 'some_id'}]
  # @return [Boolean true] -- if element is absent in DOM of page
  # @return [Boolean false] -- if element is present from DOM of page

  def element_is_absent(locator)
    begin
      @driver.find_element(locator)
      false
    rescue
      true
    end
  end

  # internal method
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

end #module WebConditions
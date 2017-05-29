module WebConditions

  # @method elements_count_to_be_more_than(ele,count)
  # @param ele [Array of WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @param count [Fixnum] -- expected count of elements present on page
  # @return [Boolean true] -- if actual count found on page is greater than expected count passed in param
  # @return [Boolean false] -- if actual count found on page is less than expected count passed in param

  def elements_count_to_be_more_than(loc,count)
    elements = @driver.find_elements(loc)
    if elements.size > count.to_i
      true
    else
      false
    end
  end


  # @method elements_count_to_be_less_than(ele,count)
  # @param ele [Array of WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @param count [Fixnum] -- expected count of elements present on page
  # @return [Boolean true] -- if actual count found on page is less than expected count passed in param
  # @return [Boolean false] -- if actual count found on page is greater than expected count passed in param

  def elements_count_to_be_less_than(loc,count)
    elements = @driver.find_elements(loc)
    if elements.size < count.to_i
      true
    else
      false
    end
  end

  # @method elements_count_to_be_equal_to(ele,count)
  # @param ele [Array of WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @param count [Fixnum] -- expected count of elements present on page
  # @return [Boolean true] -- if actual count found on page is less than expected count passed in param
  # @return [Boolean false] -- if actual count found on page is greater than expected count passed in param

  def elements_count_to_be_equal_to(loc,count)
    elements = @driver.find_elements(loc)
    if elements.size == count.to_i
      true
    else
      false
    end
  end

end #module WebConditions
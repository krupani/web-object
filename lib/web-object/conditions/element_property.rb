module WebConditions


  # @method attribute_is_present(ele,attr)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @param attr [String] -- attribute that need to be checked for presence
  # @return [Boolean true] -- if element attribute is found in the html tag in page source
  # @return [Boolean false] -- if element attribute is not found in the html tag in page source

  def attribute_is_present(ele,attr)
    element = element_or_locator(ele)
    if element.attribute(attr).empty?
      false
    else
      true
    end
  end
  alias_method :attribute_is_not_empty, :attribute_is_present


  # @method attribute_is_absent(ele,attr)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @param attr [String] -- attribute that need to be checked for absence
  # @return [Boolean true] -- if element attribute is not found in the html tag in page source
  # @return [Boolean false] -- if element attribute is found in the html tag in page source

  def attribute_is_absent(ele,attr)
    element = element_or_locator(ele)
    if element.attribute(attr).empty?
      true
    else
      false
    end
  end
  alias_method :attribute_is_empty, :attribute_is_absent


  # @method attribute_to_match(ele,attr)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @param attr [String] -- attribute that need to be checked for actual value in page source
  # @param item [String] -- expected value of attribute that needs to be exactly matched with actual in page source
  # @return [Boolean true] -- if element attribute value is exact match with expected value in the html tag in page source
  # @return [Boolean false] -- if element attribute is mismatch with expected value in the html tag in page source

  def attribute_to_match(ele,attr,item)
    element = element_or_locator(ele)
    if element.attribute(attr).to_s == (item.to_s)
      true
    else
      false
    end
  end


  # @method attribute_to_match(ele,attr)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @param attr [String] -- attribute that need to be checked for actual value in page source
  # @param item [String] -- substring value of attribute that needs to be contained within actual in page source
  # @return [Boolean true] -- if element attribute substring is present within actual value in the html tag in page source
  # @return [Boolean false] -- if actual attribute value does not contain passed substring

  def attribute_to_include(ele,attr,item)
    element = element_or_locator(ele)
    if element.attribute(attr).to_s.include?(item.to_s)
      true
    else
      false
    end
  end
  alias_method :attribute_to_contain, :attribute_to_include


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
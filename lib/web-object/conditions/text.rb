module WebConditions

  # @method text_to_be_on_page(txt)
  # @param txt [String]
  # @return [Boolean true] -- if text is found in the body of page
  # @return [Boolean false] -- if text is not found in the body of page

  def text_to_be_on_page(txt)
    # puts element_or_locator({:tag_name => 'body'}).text
    if element_or_locator({:tag_name => 'body'}).text.include?(txt)
      true
    else
      false
    end
  end

  # @method text_in_element_to_match(ele,attr)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @param txt [String] -- text that will be checked in the body of the page
  # @return [Boolean true] -- if text is found inside element and is exact match of the passed text in parameter
  # @return [Boolean false] -- if text is found inside element and is not an exact match of the passed text in parameter

  def text_in_element_to_match(ele, txt)
    if element_or_locator(ele).text == txt
      true
    else
      false
    end
  end

  # @method text_in_element_to_match(ele,attr)
  # @param ele [WebElement object]
  # @param ele [locator Hash] -- eg {:id => 'some_id'}]
  # @param txt [String] -- text that will be checked in the body of the page
  # @return [Boolean true] -- if text is found inside element and is exact match of the passed text in parameter
  # @return [Boolean false] -- if text is found inside element and is not an exact match of the passed text in parameter
  # @alias text_in_element_to_contain(txt) -- alternative name for this method, can be used as both

  def text_in_element_to_include(ele, txt)
    if element_or_locator(ele).text.include?(txt)
      true
    else
      false
    end
  end
  alias_method :text_in_element_to_contain, :text_in_element_to_include

end
module WebConditions

  def attribute_is_present(ele,attr)
    element = element_or_locator(ele)
    if element.attribute(attr).empty?
      false
    else
      true
    end
  end
  alias_method :attribute_is_not_empty, :attribute_is_present

  def attribute_is_absent(ele,attr)
    element = element_or_locator(ele)
    if element.attribute(attr).empty?
      true
    else
      false
    end
  end
  alias_method :attribute_is_empty, :attribute_is_absent

  def attribute_to_match(ele,attr,item)
    element = element_or_locator(ele)
    if element.attribute(attr).to_s == (item.to_s)
      true
    else
      false
    end
  end

  def attribute_to_include(ele,attr,item)
    element = element_or_locator(ele)
    if element.attribute(attr).to_s.include?(item.to_s)
      true
    else
      false
    end
  end
  alias_method :attribute_to_contain, :attribute_to_include

end #module WebConditions
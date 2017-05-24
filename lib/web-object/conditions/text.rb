module WebConditions

  def text_to_be_on_page(txt)
    # puts element_or_locator({:tag_name => 'body'}).text
    if element_or_locator({:tag_name => 'body'}).text.include?(txt)
      true
    else
      false
    end
  end

  def text_in_element_to_match(ele, txt)
    if element_or_locator(ele).text == txt
      true
    else
      false
    end
  end

  def text_in_element_to_include(ele, txt)
    if element_or_locator(ele).text.include?(txt)
      true
    else
      false
    end
  end

end
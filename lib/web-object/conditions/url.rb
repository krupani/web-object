module WebConditions

  def url_to_match(url)
    actual = @driver.current_url
    if actual == url
      true
    else
      false
    end
  end


  def url_to_include(url)
    actual = @driver.current_url
    if actual.include?(url)
      true
    else
      false
    end
  end

end
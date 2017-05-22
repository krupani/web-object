module WebConditions

  def title_to_match(title)
    actual = @driver.title
    if actual == title
      true
    else
      false
    end
  end


  def title_to_include(title)
    actual = @driver.title
    if actual.include?(title)
      true
    else
      false
    end
  end

end
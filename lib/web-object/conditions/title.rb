module WebConditions

  # @method title_to_match
  # @param [title] -- expected title to match the actual title of the web page
  # @return [Boolean true] -- if expected title matches the actual title on the web page
  # @return [Boolean false] -- if expected title does not match the actual title on the web page

  def title_to_match(title)
    actual = @driver.title
    if actual == title
      true
    else
      false
    end
  end

  # @method title_to_match
  # @param [title] -- expected title to match the actual title of the  web page
  # @return [Boolean true] -- if expected title matches the actual title on the web page
  # @return [Boolean false] -- if expected title does not match the actual title on the web page

  def title_to_include(title)
    actual = @driver.title
    if actual.include?(title)
      true
    else
      false
    end
  end

end
module WebConditions

  # @method url_to_match
  # @param [url] -- expected url to match the actual url on the browser
  # @return [Boolean true] -- if expected url matches the actual url on the browser
  # @return [Boolean false] -- if expected url does not match the actual url on the browser

  def url_to_match(url)
    actual = @driver.current_url
    if actual == url
      true
    else
      false
    end
  end

  # @method url_to_include
  # @param [url] -- part of the expected url to be present in actual url in the browser
  # @return [Boolean true] -- if expected url in parameter in present in actual url
  # @return [Boolean false] -- if expected url in parameter in not present in actual url

  def url_to_include(url)
    actual = @driver.current_url
    if actual.include?(url)
      true
    else
      false
    end
  end
  alias_method :url_to_contain, :url_to_include

end
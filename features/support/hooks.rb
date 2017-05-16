driver = Selenium::WebDriver.for :chrome

Before do
  @driver = driver
  @driver.manage.delete_all_cookies
end

After do |scenario|
  if scenario.failed?
    begin
      encoded_img = driver.screenshot_as(:base64)
      embed("#{encoded_img}", "image/png;base64")
    rescue
      p "*** Could not take failed scenario screenshot ***"
    end
  end
end

at_exit do
  driver.quit
end
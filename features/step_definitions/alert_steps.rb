Given(/^I am on web-object form page$/) do
  url = "https://krupani.github.io/web-object"
  # url = "file:////Users/kaushal.rupani/projects/web-object/docs/index.html"
  @driver.get(url)
end

When(/^I follow ([^"]*) button$/) do |btn|
  wo = WebObjectFormPage.new(@driver)
  case btn
    when "delayed_alert"
      wo.delayed_alert_button.click
    when "toggle_visibility"
      wo.toggle_visibility_button.click
    when "toggle_presence"
      wo.toggle_presence_button.click
    when "toggle_enabling"
      wo.toggle_enability_button.click
    when "delayed_clickability"
      wo.delayed_clickability_button.click
    when "toggle_attribute"
      wo.toggle_attribute_button.click
    when "empty_attribute"
     wo.empty_attribute_button.click
  end
end

Then(/^I wait for alert to appear$/) do
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until{alert_present?}
end
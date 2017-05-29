And(/^I wait for url to contain a sub string$/) do
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_url("contain", "newly_appended")
end

And(/^I wait for url to update$/) do
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_url("match", @base_url+"#newly_appended")
end

Then(/^I verify newly updated url$/) do
  expect(@driver.current_url).to include("#newly_appended")
end
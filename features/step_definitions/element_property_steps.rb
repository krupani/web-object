Given(/^I verify element attribute is (present|absent)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  state=="present" ? flag="color: red;" : flag=""
  expect(wo.toggle_attribute_button.attribute('style')).to eq flag
end

Then(/^I wait for attribute to be (present|absent)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_attribute(state)
end

Given(/^I verify element attribute value is (set|empty)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  state=="set" ? flag="background: yellow" : flag=""
  expect(wo.empty_attribute_button.attribute('style')).to include flag
end

Then(/^I wait for attribute value to be (set|empty)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_attribute_value(state)
end

Then(/^I wait for attribute to be (match|contain) value$/) do |action|
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_attribute_value_match(action)
end
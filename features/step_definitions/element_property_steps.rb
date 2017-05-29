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

Then(/^I wait for element count to be (greater|less|equal) (?:than|to) (\d+)$/) do |type,count|
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_element_count(type, count)
end

And(/^I verify element count is (greater|less|equal) (?:than|to) (\d+)$/) do |type,count|
  wo = WebObjectFormPage.new(@driver)
  if type=='greater'
    expect(wo.count_of_cells.size).to be > count.to_i
  elsif type == 'less'
    expect(wo.count_of_cells.size).to be < count.to_i
  else
    expect(wo.count_of_cells.size).to eq count.to_i
  end
end

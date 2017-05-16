
Then(/^I wait for text to become (invisible|visible)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_text_visibility(state)
end

Then(/^I verify n accept alert$/) do
  alert = @driver.switch_to.alert
  expect(alert.text).to eq "This is a delayed alert, came 5 seconds late"
  alert.accept
end

And(/^I verify text is (visible|invisible)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  state=="visible" ? flag=true : flag=false
  expect(wo.toggle_visibility_text.displayed?).to be flag
end

And(/^I verify link is (absent|present)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  if state=="present"
    expect(wo.toggle_presence_link.displayed?).to be true
  else
    expect(wo.toggle_presence_link).to be false
  end
end

Then(/^I wait for link to be (present|absent)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_link_presence(state)
end


And(/^I verify text field is (enabled|disabled)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  state=="enabled" ? flag=true : flag=false
  expect(wo.toggle_enability_field.enabled?).to be flag
end

Then(/^I wait for text field to be (enabled|disabled)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_field_to_be_enabled(state)
end


And(/^I verify desired button is (now|not) clickable$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  state=="now" ? flag=true : flag=false
  expect(element_is_clickable(wo.desired_clickable_button)).to be flag
end

Then(/^I wait for desired button to be clickable$/) do
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_button_to_be_clickable
end

And(/^I verify text is (absent|present)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  if state=="present"
    expect(wo.body_element.text).to include "This Link was recently added into DOM"
  else
    expect(wo.body_element.text).not_to include "This Link was recently added into DOM"
  end
end

Then(/^I wait for text to be (present|absent)$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_text_presence("This Link was recently added into DOM")
end

And(/^I verify text is (absent|present|included) inside element$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  if state=="present"
    expect(wo.toggle_presence_div.text).to include "This Link was recently added into DOM"
  elsif state == "included"
    expect(wo.toggle_presence_div.text).to include "This Link was recently added into DOM"
  else
    expect(wo.toggle_presence_div.text).not_to include "This Link was recently added into DOM"
  end
end

Then(/^I wait for text to be (present|included) inside element$/) do |state|
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_text_in_element(state, wo.toggle_presence_div, "This Link was recently added into DOM")
end


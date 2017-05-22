And(/^I wait for title to contain a sub string$/) do
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_title("contain", "New")
end

And(/^I wait for title to update$/) do
  wo = WebObjectFormPage.new(@driver)
  wo.wait_for_title("match", 'This is New Title')
end

Then(/^I verify newly updated title$/) do
  expect(@driver.title).to eq "This is New Title"
end
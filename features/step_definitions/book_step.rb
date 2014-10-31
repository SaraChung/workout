Then(/^I click trainer card named "(.*?)"$/) do |name|
  find(".card-header", text: name).click
end
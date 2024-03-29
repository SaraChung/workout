require 'sidekiq-benchmark/testing'

When(/^I visit let's workout web application$/) do
  visit root_path
end

Then(/^I go to sign in as a trainer uses "(.*?)" email$/) do |email|
  trainer = Trainer.find_by_email(email)
  visit '/trainers/sign_up'
  click_link "Sign in"
  fill_in "trainer_email", :with => email
  fill_in "trainer_password", :with => "password"
  click_button "Log in"
end

Then(/^I should see "(.*?)"$/) do |content|
  expect(page).to have_content("#{content}")
end

Then(/^I click "(.*?)" link$/) do |content|
  click_link content
end

Then(/^I fill "(.*?)" with "(.*?)"$/) do |label, value|
  fill_in label, :with => value
end

Then(/^I fill "(.*?)" with "(.*?)" on "(.*?)" form$/) do |label, value, form|
  within("##{form}") do 
    fill_in label, :with => value
  end
end

Then(/^I select "(.*?)" from "(.*?)"$/) do |value, select_name|
  select value, :from => "#{select_name}"
end

Then(/^I choose "(.*?)" from "(.*?)"$/) do |val, radio_id|
  find("##{radio_id}[value='#{val}']").set(true)
end

Then(/^I click "(.*?)" button$/) do |button|
  click_button button
end

Then(/^I should not see "(.*?)"$/) do |content|
  expect(page).to_not have_content(content)
end

When(/^I hover "(.*?)" link$/) do |link|
  find('a', text: link).hover
end

Then(/^I should see following table:$/) do |table|
  data = table.raw
end

When(/^I view "(.*?)" with id "(.*?)"$/) do |attr, id|
  find(:css, "a[data-#{attr}='#{id.to_s}']").click
end

When(/^I remove "(.*?)" with id "(.*?)"$/) do |attr, id|
  find(:css, "a[data-#{attr}='#{id.to_s}'][data-method='delete']").click
  page.driver.browser.switch_to.alert.accept
end
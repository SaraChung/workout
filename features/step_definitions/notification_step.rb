Then(/^I view a feed with id "(.*?)"$/) do |feed_id|
  find(".feed[data-feed='#{feed_id}']").click
end
notifications = [ { name: "Booking Request", subject: "User", object: "Trainer"}, { name: "Booking Confirmation", subject: "Trainer", object: "User" } ]
notifications.each do |x|
  NotificationsType.where(x, without_protection: true).first_or_create!
end
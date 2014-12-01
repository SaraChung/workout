notifications = [ { name: "Booking Request", subject: "User", object: "Trainer"}, { name: "Booking Confirmation", subject: "Trainer", object: "User" }, { name: "Workout Removal (Trainer)", subject: "Trainer", object: "User" }, { name: "Workout Removal (User)", subject: "User", object: "Trainer" }, { name: "Give Reviews", subject: "User", object: "Trainer" }]
notifications.each do |x|
  NotificationsType.where(x, without_protection: true).first_or_create!
end
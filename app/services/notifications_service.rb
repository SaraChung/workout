class NotificationsService
  def push_booking_request(user, trainer)
    type = NotificationsType.what_id("Booking Request")
    Notification.create(notifications_type_id: type, subject_id: user.id, object_id: trainer.id, title: "You have new booking request!", short_message: "[#{user.email}] send a booking request to you.", long_message: "[#{user.email}] send a booking request to you. #{its(user.first_name)} phone number is #{user.phone_number}.")
  end

  def its(name)
    name.last == "s" ? name + "'" : name + "'s"
  end
end

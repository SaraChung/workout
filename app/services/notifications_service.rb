class NotificationsService
  def push_booking_request(user, trainer_id, session_id)
    type = NotificationsType.what_id("Booking Request")
    Notification.create(notifications_type_id: type, subject_id: user.id, obj_id: trainer_id, title: "You have new booking request!", short_message: "[#{user.email}] send a booking request to you.", long_message: "[#{user.email}] send a booking request to you. #{its(user.first_name)} phone number is #{user.phone_number}.", url: app.trainers_workout_session_path(session_id), object_hash: "{ session_id: #{session_id}, trainer_id: #{trainer_id}, user_id: #{user.id} }")
  end

  def its(name)
    name.last == "s" ? name + "'" : name + "'s"
  end
end

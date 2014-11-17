class NotificationsService
  def push_booking_request(user, trainer_id, session_id, url)
    type = NotificationsType.what_id("Booking Request")
    Notification.create(notifications_type_id: type, subject_id: user.id, obj_id: trainer_id, title: "You have new booking request!", short_message: "[#{user.email}] send a booking request to you.", long_message: "[#{user.email}] send a booking request to you. #{its(user.first_name)} phone number is #{user.phone_number}.", url: url, object_hash: "{ session_id: #{session_id}, trainer_id: #{trainer_id}, user_id: #{user.id} }")
  end

  def push_booking_confirmation(trainer, session, url)
    type = NotificationsType.what_id("Booking Confirmation")
    Notification.create(notifications_type_id: type, subject_id: trainer.id, obj_id: session.user.id, title: "You receive workout session confirmation from #{trainer_assistant(trainer.is_trainer)}!", short_message: "[#{trainer.email}] send a confirmation to you.", long_message: "Your workout session request is #{session.status.downcase}. #{its(trainer.first_name)} phone number is #{trainer.phone_number}.", url: url, object_hash: "{ session_id: #{session.id}, trainer_id: #{trainer.id}, user_id: #{session.user.id} }")    
  end

  def its(name)
    name.last == "s" ? name + "'" : name + "'s"
  end

  def trainer_assistant(is_trainer)
    is_trainer == true ? "Trainer" : "Assistant"
  end

end

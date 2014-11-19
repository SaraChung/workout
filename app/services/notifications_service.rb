class NotificationsService
  def push_booking_request(user, trainer_id, session_id, url)
    type = NotificationsType.what_id("Booking Request")
    Notification.create(notifications_type_id: type, subject_id: user.id, obj_id: trainer_id, title: "You have new booking request!", short_message: "[#{user.email}] send a booking request to you.", long_message: "[#{user.email}] send a booking request to you. #{its(user.first_name)} phone number is #{user.phone_number}.", url: url, object_hash: "{ session_id: #{session_id}, trainer_id: #{trainer_id}, user_id: #{user.id} }")
  end

  def push_booking_confirmation(trainer, session, url)
    type = NotificationsType.what_id("Booking Confirmation")
    Notification.create(notifications_type_id: type, subject_id: trainer.id, obj_id: session.user.id, title: "You receive workout session confirmation from #{trainer_assistant(trainer.is_trainer)}!", short_message: "[#{trainer.email}] send a confirmation to you.", long_message: "Your workout session request is #{session.status.downcase}. #{its(trainer.first_name)} phone number is #{trainer.phone_number}.", url: url, object_hash: "{ session_id: #{session.id}, trainer_id: #{trainer.id}, user_id: #{session.user.id} }")    
  end

  def push_workout_removal(subj, subject, target, obj, session)
    type = subject == "Trainer" ? NotificationsType.what_id("Workout Removal (Trainer)") : NotificationsType.what_id("Workout Removal (User)") 
    Notification.create(notifications_type_id: type, subject_id: subj.id, obj_id: target.id, title: "Workout session has been removed!", short_message: "[#{subj.email}] removed a workout session.", long_message: "This workout session was removed. Details: <li>From #{session.from_when.to_formatted_s(:short)} to #{session.to_when.to_formatted_s(:time)}</li><li>#{subject == 'Trainer' ? 'Trainer' : 'User'}: #{subj.full_name}</li> <li>Exercise: #{session.exercise.name}</li>", url: "#", object_hash: "{ session_id: #{session.id}, trainer_id: #{subject == 'Trainer' ? subj.id : target.id}, user_id: #{session.user.id} }")
    Session.find(session.id).destroy    
  end

  def its(name)
    name.last == "s" ? name + "'" : name + "'s"
  end

  def trainer_assistant(is_trainer)
    is_trainer == true ? "Trainer" : "Assistant"
  end
end

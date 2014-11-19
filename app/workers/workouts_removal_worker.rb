class WorkoutsRemovalWorker
  include Sidekiq::Worker
  
  def perform(subject_id, subject, obj_id, obj, session_id)
    subj = subject == "Trainer" ? Trainer.find(subject_id) : User.find(subject_id)
    target = obj == "Trainer" ? Trainer.find(obj_id) : User.find(obj_id)
    session = Session.find(session_id)
    push_notification = NotificationsService.new
    push_notification.push_workout_removal(subj, subject, target, obj, session)
  end
end
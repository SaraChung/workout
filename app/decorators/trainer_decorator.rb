class TrainerDecorator < Draper::Decorator
  delegate_all
  decorates TrainersController
  def is_trainer
    is_trainer? ? "Trainer" : "Assistant"
  end
  
  def logout_link
    # link_to "Logout", destroy_trainer_session_path(self), method: :destroy if trainer_signed_in?
  end
end

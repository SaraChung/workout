class TrainerDecorator < Draper::Decorator
  delegate_all
  decorates TrainersController
  def is_trainer
    if is_trainer?
      "Trainer"
    else
      "Assistant"
    end
  end

end

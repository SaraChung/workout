class Trainers::DashboardController < TrainersController
	before_filter :authenticate_trainer!
	before_filter :load_trainer
	def index
	end

	private

	def load_trainer
		@trainer ||= current_trainer.decorate
	end
end

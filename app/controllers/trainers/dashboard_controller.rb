class Trainers::DashboardController < TrainersController
	before_filter :authenticate_trainer!
	def index
	end

end

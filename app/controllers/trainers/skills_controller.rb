class Trainers::SkillsController < TrainersController
	before_filter :authenticate_trainer!
	before_action :load_skills, only: [:create, :new]
	before_action :build_skills, only: [:create]
	def new
		@skill = current_trainer.exercises.build
	end

	def create
		redirect_to trainers_dashboard_index_path	
	end

  private

  def skills_params
  	params.permit(:skill_ids => [])
  end

  def load_skills
  	@skills ||= Exercise.all
  end

  def build_skills
  	current_trainer.exercises.destroy_all
  	skills_params[:skill_ids].each { |x| @skill = current_trainer.exercises << Exercise.find(x) } if skills_params[:skill_ids]
  end
end

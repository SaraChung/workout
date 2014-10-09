module DeviseOverrides
  extend ActiveSupport::Concern

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:first_name, :last_name, :phone_number, :gender, :is_trainer, :address, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:sign_in) do |u|
        u.permit(:email)
      end
    end
  
end

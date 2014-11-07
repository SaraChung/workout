module DashboardHelper
  def load_navigation
    user_signed_in? ? "layouts/user/navigation" : "layouts/trainer/navigation" 
  end

  def load_content
    user_signed_in? ? "layouts/user/content" : "layouts/trainer/content" 
  end
end

module DashboardHelper
  def load_navigation
    user_signed_in? ? "layouts/user/navigation" : "layouts/trainer/navigation" 
  end

  def load_content
    user_signed_in? ? "layouts/user/content" : "layouts/trainer/content" 
  end
  
  def load_sidebar
    user_signed_in? ? "layouts/user/sidebar" : "layouts/trainer/sidebar" 
  end

  def get_inside_bracket(text)
    return text.scan(/\[(.*?)\]/).flatten[0] unless text.blank?
  end
end

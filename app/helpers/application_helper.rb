module ApplicationHelper
  def its(name)
    name.last == "s" ? name + "'" : name + "'s"
  end
end

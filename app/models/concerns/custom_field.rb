module CustomField extend ActiveSupport::Concern
  def gender
    self.gender? ? "Man" : "Woman"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
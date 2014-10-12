exercises = [{ name: "Yoga"}, { name: "Zumba"}, { name: "Cycling"}, { name: "Body Pump"}, { name: "Others"}]
exercises.each do |x|
  Exercise.where(x, without_protection: true).first_or_create!
end
if Trainer.count.zero?
  exercise = Exercise.all.pluck(:id)
  15.times do
    # Add trainers
    trainer = Trainer.create(email: Faker::Internet.email, password: "11111111", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number, address: Faker::Address.street_name, gender: [1, 0].sample, is_trainer: [1, 0].sample)
    # Add trainers skills
    trainer.exercises << Exercise.find(exercise.sample)
  end
end


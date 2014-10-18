if User.count.zero? 
  15.times do
    phone_number = Faker::PhoneNumber.phone_number
    User.create(email: Faker::Internet.email, password: phone_number, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: phone_number, address: Faker::Address.street_name, gender: [1, 0].sample)
  end
end
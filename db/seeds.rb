puts "Seeding data"

if Rails.env.production?
  Dir["#{Rails.root}/db/seeds/production/*.rb"].each do |file| 
    puts "Seeding #{file.split('/')[-1]}"
    require file
  end
else
  Dir["#{Rails.root}/db/seeds/development/*.rb"].each do |file| 
    puts "Seeding #{file.split('/')[-1]}"
    require file
  end
end

puts "Done!"
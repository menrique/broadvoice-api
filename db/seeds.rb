# Seed the database
puts 'Seeding sample data...'
Cities::Repository.seed
Companies::Repository.seed
People::Repository.seed
puts 'Done'
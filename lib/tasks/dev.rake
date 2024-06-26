desc "Fill the database tables with some sample data"
task sample_data: :environment do
  puts "Creating sample data"

  if Rails.env.development?
    Alert.delete_all
    ExternalDatum.delete_all
    Organization.delete_all
    User.delete_all
  end

  # Create organizations
  organizations = []
  15.times do
    organizations << Organization.create!(
      name: Faker::Company.name
    )
  end

  # Create users
  users = []
  25.times do
    users << User.create!(
      email: Faker::Internet.unique.email,
      username: Faker::Internet.unique.username,
      name: Faker::Name.name,
      password: Faker::Internet.password(min_length: 8)
    )
  end

  # Generate unique usernames for each user
  unique_usernames = users.map { |user| Faker::Internet.unique.username(specifier: user.username) }

  # Create external data and alerts
  external_data = []
  users.each_with_index do |user, user_index|
    organizations.each do |organization|
      # Randomly choose if the user will have the same email for multiple external datums
      same_email = [true, false].sample

      # Create the external datum
      external_datum = ExternalDatum.create!(
        user_id: user.id,
        organization_id: organization.id,
        ext_username: Faker::Internet.unique.username,
        ext_email: same_email ? user.email : Faker::Internet.unique.email,
        main_email: [true, false].sample
      )

      # Create an alert for the external datum
      Alert.create!(
        external_datum_id: external_datum.id
      )

      external_data << external_datum
    end
  end

  puts "Sample data generated successfully!"
end

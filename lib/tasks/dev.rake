desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Creating sample data"

  if Rails.env.development?
    email.destroy_all
     .destroy_all
    Like.destroy_all
    Photo.destroy_all
    User.destroy_all
  end


  12.times do
    name = Faker::Name.name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name,
    )
   end
  end
end

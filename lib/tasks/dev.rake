task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    Transaction.destroy_all
    User.destroy_all
  end

  usernames = Array.new { Faker::Name.first_name }

  usernames << "Alice"
  usernames << "Bob"

  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username,
    )
  end

  # users=User.all

  # 5.times do
  #   u = User.new
  #   u.username = Faker::Name.first_name
  #   u.email = "#{u.username}@email.com"
  #   u.password = "password"

  #   u.save
  #   p "#{u.username}"
  # end

  p "#{User.count} users have been created."

  users = User.all

  users.each do |user|
    rand(100).times do
      user.transactions.create(
        amount: rand(7..30),
        receipt: "https://robohash.org/#{rand(9999)}",
        category: "Lunch",
        date: Faker::Date.between(from: '2020-01-01', to: Date.today)
      )
    end
  end
  
  p "There are now #{User.count} users."
  p "#{Transaction.count} transactions."

end
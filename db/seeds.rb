puts 'Destroying old records...'
Restaurant.destroy_all
puts 'Seeding...'
10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    category: Restaurant::CATEGORY.sample,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code
  )
  rand(0..10).times do
    review = Review.new(
      rating: rand(0..5),
      content: Faker::Restaurant.review
    )
    review.restaurant = restaurant
    review.save
  end
end
puts "#{Restaurant.count} restaurants created."
puts "#{Review.count} reviews created."

User.create!(email: 'admin@example.com', password: 'admin1', password_confirmation: 'admin1')

30.times do 
  Course.create(
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user: User.first
  )
end

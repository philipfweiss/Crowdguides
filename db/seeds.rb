#
# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end
#
# if User.count > 6
#   users = User.order(:created_at).take(6)
#   50.times do
#     content = Faker::University.name + " Admissions Guide"
#     users.each { |user| user.guides.create!(title: content, description: "None!") }
#   end
# end
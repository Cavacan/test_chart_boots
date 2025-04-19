User.destroy_all
StepRecord.destroy_all

user_a = User.create!(email: "a@example.com", password: "password")
user_b = User.create!(email: "b@example.com", password: "password")

(1..31).each do |day|
  StepRecord.create!(user: user_a, date: Date.new(2025, 1, day), steps: rand(3000..10000))
  StepRecord.create!(user: user_b, date: Date.new(2025, 1, day), steps: rand(3000..10000))
end

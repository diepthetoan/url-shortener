FactoryBot.define do
  factory :user do
    name { 'User 1' }
    email { 'user1@gmail.com' }
    password { '12345678' }
  end
end
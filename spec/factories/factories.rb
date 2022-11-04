FactoryBot.define do
  factory :user do
    name { 'jane' }
    email { "#{name}@example.com".downcase }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

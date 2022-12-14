FactoryBot.define do
  factory :user do
    name { 'jane' }
    email { "#{name}@example.com".downcase }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :expense do
    association :user, factory: :user
    name { 'Mc Donalds' }
    description { 'Lots of cash spent here' }
    icon { 'Icon Url' }
  end

  factory :detail do
    association :expense, factory: :expense
    name { 'Transaction 1' }
    amount { '300' }
  end
end

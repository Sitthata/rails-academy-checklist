# This will guess the User class
FactoryBot.define do
  factory :task do
    description { 'Sample task description' }
    completed { false }
  end
end
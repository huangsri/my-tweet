FactoryBot.define do
  factory :tweet do
    content { 'this is a content WOW!' }
    user { build(:user) }
  end
end

FactoryBot.define do
  factory :tweet do
    content { 'this is content' }
    user { create(:user) }
  end
end

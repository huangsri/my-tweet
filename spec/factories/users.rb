FactoryBot.define do
  factory :user do
    sequence(:email)    { |n| "abc#{n}@abc.com"}
    password            { '12341234' }

    factory :user_with_tweets do
      tweets { [create(:tweet)] }
    end

  end
end

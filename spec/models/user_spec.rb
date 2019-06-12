require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'valid factories' do
    context :user do
      subject {build(:user)}
      it { is_expected.to be_valid }
    end

    context :user_with_tweets do
      subject {build(:user_with_tweets)}
      it { is_expected.to be_valid }
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:tweets) }
  end

end

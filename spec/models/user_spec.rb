require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject(:valid_user) do
    # described_class.new(email: 'abc@abc.com', password: '12341234') old version before factory bot
    # build(:user)
    create(:user)
  end
  
  # describe 'valid user' do
  #   it 'is valid' do
  #     expect(valid_user).to be_valid
  #   end
  # end

  describe 'valid factories' do
    context :user do
      it { is_expected.to be_valid }
    end

    context :user_with_tweets do
      subject { build(:user_with_tweets) }
      it { is_expected.to be_valid }
    end
  end
  
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email)}


    # it { is_expected.to validate_uniqueness_od(:email)}
    # it { is_expected.to validate_presence_of(:password)}

    # it 'is invalid without email' do
    #   valid_user.email = ""
    #   expect(valid_user).to be_invalid
    #   expect(valid_user.errors).to include(:email)
    # end

    # it 'is valid proper email' do
    #   valid_user.email = 'abc@abc.com'
    #   expect(valid_user).to be_valid
    # end
  end

  describe 'association' do
    it { is_expected.to have_many(:tweet) }
  end

end

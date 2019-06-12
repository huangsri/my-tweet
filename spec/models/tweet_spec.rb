require 'rails_helper'

RSpec.describe Tweet, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # describe 'validations' do
  #   it 'is invalid without content' do
  #     subject = described_class.new(content: "")
  #     expect(subject).to be_invalid
  #   end
  # end
  describe 'valid factory' do
    context :user do
      subject { build(:user) }
      it { is_expected.to be_valid }
    end
  end



  describe 'validations' do
    it { is_expected.to validate_presence_of(:content)}
  end


end

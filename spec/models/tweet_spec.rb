# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'valid factories' do
    context :user do
      subject { build(:tweet) }
      it { is_expected.to be_valid }
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end
end
